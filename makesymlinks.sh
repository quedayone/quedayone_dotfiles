#!/bin/bash
# ==============================================================================
# .make.sh
# This script creates symlinks from the home directory 
# to any desired dotfiles in ~/dotfiles
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
#
# Edit by WIll Pierce
# March 11, 2015
# ==============================================================================

# Variables
dir=~/quedayone_dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="bashrc bash_profile bash_aliases gitconfig gitignore_global"    

# ==============================================================================
# create dotfiles_old in homedir
# ==============================================================================
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo ""
echo "done"

# ==============================================================================
# change to the dotfiles directory
# ==============================================================================
echo ""
echo -n "Changing to the $dir directory ..."
cd $dir
echo ""
echo "done"
echo ""

# ==============================================================================
# move any existing dotfiles in homedir to dotfiles_old directory, 
# then create symlinks from the homedir to any files in the ~/dotfiles 
# directory specified in $files
# ==============================================================================
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo ""
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
echo ""
echo created symlinks for files $files
echo ""
echo be sure and add your name and email address to file gitconfig.
echo If the settings do not take effect right away, just log out and log back in. This will re-source your dotfiles.
exit 0
