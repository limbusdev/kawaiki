#!/bin/bash
# Installation script for Kawaiki-Icon-Theme

green='\033[0;32m'
NC='\033[0m' # No Color

echo " __   ___  __  __           _   __        __   __   ___  __      __      ____    __  "
echo "|  | /  / |  \ \ \         | | |  \      |  | |  | /  / |  |    |  \    |    \  /  / "
echo "|  |/  /  |   \ \ \   __   | | |   \     |  | |  |/  /  |  |    |   \   | |\  \/  /  "
echo "|     /   | |\ \ \ \ |  \  | | | |\ \    |  | |     /   |  | __ | |\ \  | | \    /   "
echo "|     \   | |_\ \ \ \||\ \ | | | |_\ \   |  | |     \   |  ||__|| | \ \ | | /    \   "
echo "|  |\  \  |  __  \ \  | \ \| | |  __  \  |  | |  |\  \  |  |    | |  \ \| |/  /\  \  "
echo "|__| \__\ |_|  \__\ \_|  \___| |_|  \__\ |__| |__| \__\ |__|    |_|   \______/  \__\ "   

echo ""
echo -e "${green}             --------------------------------${NC}"
echo -e "${green}              KawaikiNX Icon Theme Installer ${NC}"
echo -e "${green}             --------------------------------${NC}"
echo ""

# Check if executing user has root-priviliges
ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "KawaikiNX-Icon-Theme will be copied to $HOME/.icons. To make it available system-wide, run as root."
else
	echo "KawaikiNX-Icon-Theme will be copied to /usr/share/icons. To make it available for yourself only, run as standard-user"
fi

# Ask if process should be continued
read -p "Continue? [y/n]" ans

if [ "$ans" == "n" ]
then
    exit
fi

# this directory
basedir=$(pwd)
theme1="/KawaikiNX-Only"
theme1source=$basedir$theme1
theme2="/KawaikiNX-GoldenSunshine"
theme2source=$basedir$theme2
theme3="/KawaikiNX-HappyFrog"
theme3source=$basedir$theme3
theme4="/KawaikiNX-HumanEarth"
theme4source=$basedir$theme4
theme5="/KawaikiNX-IcePrincess"
theme5source=$basedir$theme5
theme6="/KawaikiNX-Silver"
theme6source=$basedir$theme6
theme7="/KawaikiNX-PurpleGem"
theme7source=$basedir$theme7
theme8="/KawaikiNX-SummerWine"
theme8source=$basedir$theme8
theme9="/KawaikiNX-BreezyForest"
theme9source=$basedir$theme9
theme10="/KawaikiNX-WildSerengeti"
theme10source=$basedir$theme10
theme11="/KawaikiNX-PitchBlack"
theme11source=$basedir$theme11
theme12="/KawaikiNX-SnowWhite"
theme12source=$basedir$theme12
theme13="/KawaikiNX-AzurOcean"
theme13source=$basedir$theme13

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
    cp -r $theme13source ~/.icons/
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
    cp -r $theme13source /usr/share/icons/
fi

# Copy XFCE specific icons
echo "Are you using XFCE? If using XFCE please type y,"
echo "otherwise battery icons will be too big. [y/n]"

xfcepath="/XFCE/status"
statuspath=$basedir$xfcepath
read xfce
if [ "$xfce" == "y" ]
  then
    if [ "$UID" -ne "$ROOT_UID" ]
      then
      cp -r $statuspath ~/.icons/KawaikiNX-Only/
    else
      mkdir /usr/share/icons
      cp -r $statuspath /usr/share/icons/KawaikiNX-Only/
    fi
fi

# customize theme installation

echo "Would you like to use specific theme-settings for your system?"
echo "Standard [s]"
echo "Dark panel [d]"
echo "Light panel [l]"
echo "Xubuntu [x]"

themeindex="/Theme-Index/standard/index.theme"

read theme
if [ "$theme" == "s" ]
    then echo "nothing will be changed"
    elif [ "$theme" == "d" ]
        then themeindex="/Theme-Index/ubuntu-dark/index.theme"
    elif [ "$theme" == "l" ]
        then themeindex="/Theme-Index/ubuntu-light/index.theme"
    elif [ "$theme" == "x" ]
        then themeindex="/Theme-Index/xubuntu-dark/index.theme"
    else echo "nothing will be changed"
fi

themeindexsrc=$basedir$themeindex

if [ "$UID" -ne "$ROOT_UID" ]
then
    cp $themeindexsrc ~/.icons/KawaikiNX-Only/
else
    mkdir /usr/share/icons
    cp $themeindexsrc /usr/share/icons/KawaikiNX-Only/
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
    cp -r $brightnesssrc ~/.icons/KawaikiNX-Only/
else
    mkdir /usr/share/icons
    cp -r $brightnesssrc /usr/share/icons/KawaikiNX-Only/
fi


echo "You can use Gnome/Unity Tweak Tool, to choose KawaikiNX-Icon-Theme."
echo "Thanks for installing! Please consider donating to this project."

exit










