#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

windowsFlag=0	# 1 if we are running this on Windows
if [[ $SYSTEMROOT == "C:\\windows" ]]; then 
	windowsFlag=1
	HOME=$USERPROFILE
fi

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
linux_files="bashrc vim zshrc oh-my-zsh vimperatorrc"    # list of files/folders to symlink in homedir (for linux)
win_files="vim vimperatorrc"    # list of files/folders to symlink in homedir (for windows)

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
if [[ windowsFlag -eq 0 ]]; then 
	echo "Moving any existing dotfiles from ~ to $olddir"
	for file in $linux_files; do 
	    mv ~/.$file ~/dotfiles_old/
	    echo "Creating symlink to $file in home directory."
	    ln -s $dir/$file ~/.$file
   	done
else # with windows, we only care about vim and vimperatorrc for now. 
	echo "Deleting any existing files in $olddir, and moving existing dotfiles to that directory."
	for file in $win_files; do
		if [[ $file == 'vim' ]]; then # Windows requires "vim" directory be called "vimfiles"
			rmdir $HOME\\dotfiles_old\\vimfiles 2>/dev/null
			mv $HOME\\vimfiles $HOME\\dotfiles_old\\ 2>/dev/null
			echo "mklink /d $HOME\\vimfiles $HOME\\dotfiles\\vim" | cmd /C /Q 1>/dev/null
		else
			if [[ -d $HOME\\dotfiles_old\\$file ]]; then
				rmdir $HOME\\dotfiles_old\\$file 2>/dev/null
			else 
				rm $HOME\\dotfiles_old\\.$file 2>/dev/null
			fi
			mv $HOME\\.$file $HOME\\dotfiles_old\\
			echo "mklink $HOME\\.$file $HOME\\dotfiles\\$file" | cmd /C /Q 1>/dev/null
		fi
    done
fi 

#install_zsh () {
## Test to see if zshell is installed.  If it is:
#if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
#    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
#    if [[ ! -d $dir/oh-my-zsh/ ]]; then
#        git clone http://github.com/robbyrussell/oh-my-zsh.git
#    fi
#    # Set the default shell to zsh if it isn't currently set to zsh
#    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
#        chsh -s $(which zsh)
#    fi
#else
#    # If zsh isn't installed, get the platform of the current machine
#    platform=$(uname);
#    # If the platform is Linux, try an apt-get to install zsh and then recurse
#    if [[ $platform == 'Linux' ]]; then
#        if [[ -f /etc/redhat-release ]]; then
#            sudo yum install zsh
#            install_zsh
#        fi
#        if [[ -f /etc/debian_version ]]; then
#            sudo apt-get install zsh
#            install_zsh
#        fi
#    # If the platform is OS X, tell the user to install zsh :)
#    elif [[ $platform == 'Darwin' ]]; then
#        echo "Please install zsh, then re-run this script!"
#        exit
#    fi
#fi
#}
#
#install_zsh
