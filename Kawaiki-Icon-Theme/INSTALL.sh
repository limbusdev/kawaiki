#!/bin/bash
# Installation script for Kawaiki-Icon-Theme

echo " __   ___  __  __           _   __        __   __   ___  __ "
echo "|  | /  / |  \ \ \         | | |  \      |  | |  | /  / |  |"
echo "|  |/  /  |   \ \ \   __   | | |   \     |  | |  |/  /  |  |"
echo "|     /   | |\ \ \ \ |  \  | | | |\ \    |  | |     /   |  |"
echo "|     \   | |_\ \ \ \||\ \ | | | |_\ \   |  | |     \   |  |"
echo "|  |\  \  |  __  \ \  | \ \| | |  __  \  |  | |  |\  \  |  |"
echo "|__| \__\ |_|  \__\ \_|  \___| |_|  \__\ |__| |__| \__\ |__|"

echo ""
echo "             ------------------------------"
echo "              Kawaiki Icon Theme Installer"
echo "             ------------------------------"
echo ""

# Check if executing user has root-priviliges
ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Kawaiki-Icon-Theme will be copied to $HOME/.icons. To make it available system-wide, run as root."
else
	echo "Kawaiki-Icon-Theme will be copied to /usr/share/icons. To make it available for yourself only, run as standard-user"
fi

# Ask if process should be continued
read -p "Continue? [y/n]" ans

if [ "$ans" == "n" ]
then
    exit
fi

# this directory
basedir=$(pwd)
theme1="/Kawaiki-Only"
theme1source=$basedir$theme1
theme2="/Kawaiki-GoldenSunshine"
theme2source=$basedir$theme2
theme3="/Kawaiki-HappyFrog"
theme3source=$basedir$theme3
theme4="/Kawaiki-HumanEarth"
theme4source=$basedir$theme4
theme5="/Kawaiki-IcePrincess"
theme5source=$basedir$theme5
theme6="/Kawaiki-PinkPatrick"
theme6source=$basedir$theme6
theme7="/Kawaiki-PurpleGem"
theme7source=$basedir$theme7
theme8="/Kawaiki-SummerWine"
theme8source=$basedir$theme8
theme9="/Kawaiki-TurquoiseBay"
theme9source=$basedir$theme9
theme10="/Kawaiki-WildSerengeti"
theme10source=$basedir$theme10
theme11="/Kawaiki-PitchBlack"
theme11source=$basedir$theme11
theme12="/Kawaiki-SnowWhite"
theme12source=$basedir$theme12

# copy files, depending on user-rights

if [ "$UID" -ne "$ROOT_UID" ]
then
    mkdir ~/.icons
    cp -r $theme1source ~/.icons/
    cp -r $theme2source ~/.icons/
    cp -r $theme3source ~/.icons/
    cp -r $theme4source ~/.icons/
    cp -r $theme5source ~/.icons/
    cp -r $theme6source ~/.icons/
    cp -r $theme7source ~/.icons/
    cp -r $theme8source ~/.icons/
    cp -r $theme9source ~/.icons/
    cp -r $theme10source ~/.icons/
    cp -r $theme11source ~/.icons/
    cp -r $theme12source ~/.icons/
else
    mkdir /usr/share/icons
    cp -r $theme1source /usr/share/icons/
    cp -r $theme2source /usr/share/icons/
    cp -r $theme3source /usr/share/icons/
    cp -r $theme4source /usr/share/icons/
    cp -r $theme5source /usr/share/icons/
    cp -r $theme6source /usr/share/icons/
    cp -r $theme7source /usr/share/icons/
    cp -r $theme8source /usr/share/icons/
    cp -r $theme9source /usr/share/icons/
    cp -r $theme10source /usr/share/icons/
    cp -r $theme11source /usr/share/icons/
    cp -r $theme12source /usr/share/icons/
fi

# customize theme installation

echo "Would you like to use specific theme-settings for your system?"
echo "Standard [s]"
echo "Ubuntu, dark panel [ud]"
echo "Ubuntu, light panel [ul]"
echo "Xubuntu [x]"

themeindex="/Theme-Index/standard/index.theme"

read theme
if [ "$theme" == "s" ]
    then echo "nothing will be changed"
    elif [ "$theme" == "ud" ]
        then themeindex="/Theme-Index/ubuntu-dark/index.theme"
    elif [ "$theme" == "ul" ]
        then themeindex="/Theme-Index/ubuntu-light/index.theme"
    elif [ "$theme" == "x" ]
        then themeindex="/Theme-Index/xubuntu-dark/index.theme"
    else echo "nothing will be changed"
fi

themeindexsrc=$basedir$themeindex

if [ "$UID" -ne "$ROOT_UID" ]
then
    cp $themeindexsrc ~/.icons/Kawaiki-Only/
else
    mkdir /usr/share/icons
    cp $themeindexsrc /usr/share/icons/Kawaiki-Only/
fi


echo "Is your GTK theme rather dark or bright?"
echo "Light [l] (fits Ubuntu Radiance)"
echo "Dark [d]"
echo "Ubuntu Ambience [u]"
echo "Xubuntu [x]"

brightness="/brightness/light/*"

read theme
if [ "$theme" == "l" ]
    then echo "nothing will be changed"
    elif [ "$theme" == "d" ]
        then brightness="/brightness/dark/*"
    elif [ "$theme" == "u" ]
        then brightness="/brightness/ubuntu-ambience/*"
    elif [ "$theme" == "x" ]
        then brightness="/brightness/xubuntu/*"
    else echo "nothing will be changed"
fi

brightnesssrc=$basedir$brightness

if [ "$UID" -ne "$ROOT_UID" ]
then
    cp -r $brightnesssrc ~/.icons/Kawaiki-Only/
else
    mkdir /usr/share/icons
    cp -r $brightnesssrc /usr/share/icons/Kawaiki-Only/
fi


echo "You can use Gnome/Unity Tweak Tool, to choose Kawaiki-Icon-Theme."
echo "Thanks for installing! Please consider donating to this project."

exit










