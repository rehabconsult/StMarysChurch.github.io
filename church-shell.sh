#!/bin/sh
echo "Working in $(pwd)"
echo "Do you want to update git-project directory (Y(Yes)/N(No))"
read update
directory=$(pwd)
if [ "$update" = "Y" -o "$update" = "y" ];
then 
	echo "Enter the location of church-git"
	read directory
	cd $directory
fi
cd /home/roney/church-git/google-appengine-church-website #to remove later
git status
echo "Do you want to add files (Y(Yes)/N(No))"
read choice 
if [ "$choice" = "Y" -o "$choice" = "y" ];
then
	echo "You choose Y"
	git add .
	git status
	#another
	echo "Enter the git commit msg"
	read msg
	git commit -m "$msg"
	git push
	# end of another
else
	echo "You choose N"
fi
echo "Do you want to see the church-git in dev Gogle App Engine (Y(Yes)/N(No))"
read dev
if [ "$dev" = "Y" -o "$dev" = "y" ];
then
	echo "Enter the GAE directory"
	read gaedir
	cd $gaedir
	./dev_appserver.py $directory
fi
echo "Do you want to push church-git to Gogle App Engine (Y(Yes)/N(No))"
read gae
if [ "$gae" = "Y" -o "$gae" = "y" ];
then
	echo "Enter the GAE directory"
	read gaedir
	cd $gaedir
	./appcfg.py update $directory
fi