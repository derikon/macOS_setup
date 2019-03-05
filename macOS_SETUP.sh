#!/bin/bash

C_CLEAR="\033[0m"
C_RED="\033[31m"
C_GREEN="\033[32m"
C_YELLOW="\033[33m"
C_H1="\033[1;101;97m"
C_H2="\033[1;105;97m"
C_H3="\033[1;45;97m"


echo -e ""
echo -e "${C_H1}"
echo -e "                                                                                "
echo -e "                               *****************                                "
echo -e "                               macOS BASIC SETUP                                "
echo -e "                               *****************                                "
echo -e "                                                                                "
echo -e " ______________________________________________________________________________ "
echo -e "                                                                                "
echo -e " MIT License                                                                    "
echo -e "                                                                                "
echo -e " Copyright (c) 2019 derikon                                                     "
echo -e "                                                                                "
echo -e " Permission is hereby granted, free of charge, to any person obtaining a copy   "
echo -e " of this software and associated documentation files (the \"Software\"), to deal  "
echo -e " in the Software without restriction, including without limitation the rights   "
echo -e " to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      "
echo -e " copies of the Software, and to permit persons to whom the Software is          "
echo -e " furnished to do so, subject to the following conditions:                       "
echo -e "                                                                                "
echo -e " The above copyright notice and this permission notice shall be included in all "
echo -e " copies or substantial portions of the Software.                                "
echo -e "                                                                                "
echo -e " THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     "
echo -e " IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       "
echo -e " FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    "
echo -e " AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         "
echo -e " LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  "
echo -e " OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  "
echo -e " SOFTWARE.                                                                      "
echo -e " ______________________________________________________________________________ "
echo -e "                                                                                "
echo -e " If you don't want to risk any damage, press CTRL + C to quit.                  "
echo -e "                                                                                "
echo -e "${C_CLEAR}"
echo -e ""


h1 () {
    echo -e "${C_H1}"
    echo -e " $1"
    echo -e "${C_CLEAR}" 
}

h2 () {
    echo -e "${C_H2}"
    echo -e " $1"
    echo -e "${C_CLEAR}" 
}

h3 () {
    echo -e "${C_H3}"
    echo -e " $1"
    echo -e "${C_CLEAR}" 
}

INSTALLED_FORMULAE="Installed Formulae:"
install_brew_formula () {
    local FORMULA=$1
    h3 ${FORMULA}
    if brew ls --versions ${FORMULA} &> /dev/null; then
        echo -e "${C_GREEN}already installed${C_CLEAR}"
    else
        echo -e "${C_YELLOW}install ${FORMULA} - this might take a while ...${C_CLEAR}"
        $(brew install ${FORMULA} &> /dev/null) &> /dev/null
        if [[ $? != 0 ]]; then
            echo -e "${C_RED}FAILED!${C_CLEAR}"
        else
            echo -e "${C_GREEN}finished${C_CLEAR}"
            INSTALLED_FORMULAE="${INSTALLED_FORMULAE} ${FORMULA}"
        fi
    fi
}

INSTALLED_CASKS="Installed Casks:"
install_brew_cask () {
    local CASK=$1
    h3 ${CASK}
    echo -e "${C_YELLOW}install ${CASK} - this might take a while ...${C_CLEAR}"
    $(brew cask install ${CASK} &> /dev/null) &> /dev/null
    if [[ $? != 0 ]]; then
        echo -e "${C_RED}FAILED!${C_CLEAR}"
    else
        echo -e "${C_GREEN}finished${C_CLEAR}"
        INSTALLED_CASKS="${INSTALLED_CASKS} ${CASK}"
    fi
}



# **************************
# USER DEFINED CONFIGURATION
# **************************



h2 "Should I install terminal tools?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install terminal tools.${C_CLEAR}"
    INSTALL_TERMINAL=n
else
    echo -e "${C_GREEN}Will install terminal tools.${C_CLEAR}"
    INSTALL_TERMINAL=y
fi


h2 "Should I install utilities?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install utilities.${C_CLEAR}"
    INSTALL_UTILS=n
else
    echo -e "${C_GREEN}Will install utilities.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_UTILS=y
    read -p "Install Dash? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Dash.${C_CLEAR}"
        INSTALL_DASH=n
    else
        echo -e "${C_GREEN}Will install Dash.${C_CLEAR}"
        INSTALL_DASH=y
    fi
    read -p "Install SourceTree? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install SourceTree.${C_CLEAR}"
        INSTALL_SOURCETREE=n
    else
        echo -e "${C_GREEN}Will install SourceTree.${C_CLEAR}"
        INSTALL_SOURCETREE=y
    fi
    read -p "Install AppCleaner? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install AppCleaner.${C_CLEAR}"
        INSTALL_APPCLEANER=n
    else
        echo -e "${C_GREEN}Will install AppCleaner.${C_CLEAR}"
        INSTALL_APPCLEANER=y
    fi
    read -p "Install GPG Suite? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install GPG Suite.${C_CLEAR}"
        INSTALL_GPG=n
    else
        echo -e "${C_GREEN}Will install GPG Suite.${C_CLEAR}"
        INSTALL_GPG=y
    fi
    read -p "Install Little Snitch? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Little Snitch.${C_CLEAR}"
        INSTALL_LITTLESNITCH=n
    else
        echo -e "${C_GREEN}Will install Little Snitch.${C_CLEAR}"
        INSTALL_LITTLESNITCH=y
    fi
fi


h2 "Should I install media tools?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install media tools.${C_CLEAR}"
    INSTALL_MEDIA=n
else
    echo -e "${C_GREEN}Will install media tools.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_MEDIA=y
    read -p "Install VLC? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install VLC.${C_CLEAR}"
        INSTALL_VLC=n
    else
        echo -e "${C_GREEN}Will install VLC.${C_CLEAR}"
        INSTALL_VLC=y
    fi
    read -p "Install GIMP? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install GIMP.${C_CLEAR}"
        INSTALL_GIMP=n
    else
        echo -e "${C_GREEN}Will install GIMP.${C_CLEAR}"
        INSTALL_GIMP=y
    fi
    read -p "Install Inkscape? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Inkscape.${C_CLEAR}"
        INSTALL_INKSCAPE=n
    else
        echo -e "${C_GREEN}Will install Inkscape.${C_CLEAR}"
        INSTALL_INKSCAPE=y
    fi
fi


h2 "Should I install online tools?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install online tools.${C_CLEAR}"
    INSTALL_ONLINE=n
else
    echo -e "${C_GREEN}Will install online tools.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_ONLINE=y
    read -p "Install Thunderbird? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Thunderbird.${C_CLEAR}"
        INSTALL_THUNDERBIRD=n
    else
        echo -e "${C_GREEN}Will install Thunderbird.${C_CLEAR}"
        INSTALL_THUNDERBIRD=y
    fi
    read -p "Install Firefox? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Firefox.${C_CLEAR}"
        INSTALL_FIREFOX=n
    else
        echo -e "${C_GREEN}Will install Firefox.${C_CLEAR}"
        INSTALL_FIREFOX=y
    fi
    read -p "Install Tor? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Tor.${C_CLEAR}"
        INSTALL_TOR=n
    else
        echo -e "${C_GREEN}Will install Tor.${C_CLEAR}"
        INSTALL_TOR=y
    fi
fi


h2 "Should I install office tools?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install office tools.${C_CLEAR}"
    INSTALL_OFFICE=n
else
    echo -e "${C_GREEN}Will install office tools.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_OFFICE=y
    read -p "Install LibreOffice? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install LibreOffice.${C_CLEAR}"
        INSTALL_LIBREOFFICE=n
    else
        echo -e "${C_GREEN}Will install LibreOffice.${C_CLEAR}"
        INSTALL_LIBREOFFICE=y
    fi
    read -p "Install MacTeX? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install MacTeX.${C_CLEAR}"
        INSTALL_MACTEX=n
    else
        echo -e "${C_GREEN}Will install MacTeX.${C_CLEAR}"
        INSTALL_MACTEX=y
    fi
    read -p "Install Texpad? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Texpad.${C_CLEAR}"
        INSTALL_TEXPAD=n
    else
        echo -e "${C_GREEN}Will install Texpad.${C_CLEAR}"
        INSTALL_TEXPAD=y
    fi
    read -p "Install MacDown? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install MacDown.${C_CLEAR}"
        INSTALL_MACDOWN=n
    else
        echo -e "${C_GREEN}Will install MacDown.${C_CLEAR}"
        INSTALL_MACDOWN=y
    fi
    read -p "Install Mendeley? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Mendeley.${C_CLEAR}"
        INSTALL_MENDELEY=n
    else
        echo -e "${C_GREEN}Will install Mendeley.${C_CLEAR}"
        INSTALL_MENDELEY=y
    fi
fi


h2 "Should I install tools for team comunication?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools team comunication.${C_CLEAR}"
    INSTALL_CHAT=n
else
    echo -e "${C_GREEN}Will install tools for team comunication.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_CHAT=y
    read -p "Install Adium? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Adium.${C_CLEAR}"
        INSTALL_ADIUM=n
    else
        echo -e "${C_GREEN}Will install Adium.${C_CLEAR}"
        INSTALL_ADIUM=y
    fi
    read -p "Install Skype? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Skype.${C_CLEAR}"
        INSTALL_SKYPE=n
    else
        echo -e "${C_GREEN}Will install Skype.${C_CLEAR}"
        INSTALL_SKYPE=y
    fi
    read -p "Install Slack? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Slack.${C_CLEAR}"
        INSTALL_SLACK=n
    else
        echo -e "${C_GREEN}Will install Slack.${C_CLEAR}"
        INSTALL_SLACK=y
    fi
fi


h2 "Should I install IDEs?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install IDEs.${C_CLEAR}"
    INSTALL_IDE=n
else
    echo -e "${C_GREEN}Will install IDEs.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_IDE=y
    read -p "Install Atom? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Atom.${C_CLEAR}"
        INSTALL_ATOM=n
    else
        echo -e "${C_GREEN}Will install Atom.${C_CLEAR}"
        INSTALL_ATOM=y
    fi
    read -p "Install Sublime Text? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Sublime Text.${C_CLEAR}"
        INSTALL_SUBLIMETEXT=n
    else
        echo -e "${C_GREEN}Will install Sublime Text.${C_CLEAR}"
        INSTALL_SUBLIMETEXT=y
    fi
    read -p "Install Visual Studio? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Visual Studio.${C_CLEAR}"
        INSTALL_VISUALSTUDIO=n
    else
        echo -e "${C_GREEN}Will install Visual Studio.${C_CLEAR}"
        INSTALL_VISUALSTUDIO=y
    fi
    read -p "Install Visual Studio Code? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Visual Studio Code.${C_CLEAR}"
        INSTALL_VISUALSTUDIOCODE=n
    else
        echo -e "${C_GREEN}Will install Visual Studio Code.${C_CLEAR}"
        INSTALL_VISUALSTUDIOCODE=y
    fi
fi


h2 "Should I install tools for C++ development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for C++ development.${C_CLEAR}"
    INSTALL_CPP=n
else
    echo -e "${C_GREEN}Will install tools for C++ development.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_CPP=y
    read -p "Install CLion? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install CLion.${C_CLEAR}"
        INSTALL_CLION=n
    else
        echo -e "${C_GREEN}Will install CLion.${C_CLEAR}"
        INSTALL_CLION=y
    fi
fi


h2 "Should I install tools for Python development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for Python development.${C_CLEAR}"
    INSTALL_PYTHON=n
else
    echo -e "${C_GREEN}Will install tools for Python development.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_PYTHON=y
    read -p "Install Anaconda? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Anaconda.${C_CLEAR}"
        INSTALL_ANACONDA=n
    else
        echo -e "${C_GREEN}Will install Anaconda.${C_CLEAR}"
        INSTALL_ANACONDA=y
    fi
    read -p "Install PyCharm? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install PyCharm.${C_CLEAR}"
        INSTALL_PYCHARM=n
    else
        echo -e "${C_GREEN}Will install PyCharm.${C_CLEAR}"
        INSTALL_PYCHARM=y
    fi
fi


h2 "Should I install tools for game development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for game development.${C_CLEAR}"
    INSTALL_GAME=n
else
    echo -e "${C_GREEN}Will install tools for game development.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_GAME=y
    read -p "Install Epic Games (Unreal Engine)? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Epic Games (Unreal Engine).${C_CLEAR}"
        INSTALL_EPIC=n
    else
        echo -e "${C_GREEN}Will install Epic Games (Unreal Engine).${C_CLEAR}"
        INSTALL_EPIC=y
    fi
    read -p "Install Unity Hub? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Unity Hub.${C_CLEAR}"
        INSTALL_UNITY=n
    else
        echo -e "${C_GREEN}Will install Unity Hub.${C_CLEAR}"
        INSTALL_UNITY=y
    fi
    read -p "Install Rider? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Rider.${C_CLEAR}"
        INSTALL_RIDER=n
    else
        echo -e "${C_GREEN}Will install Rider.${C_CLEAR}"
        INSTALL_RIDER=y
    fi
fi


h2 "Should I install tools for Android development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for Android development.${C_CLEAR}"
    INSTALL_ANDROID=n
else
    echo -e "${C_GREEN}Will install tools for Android development.${C_CLEAR}"
    INSTALL_ANDROID=y
fi


h2 "Should I install tools for Qt development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for Qt development.${C_CLEAR}"
    INSTALL_QT=n
else
    echo -e "${C_GREEN}Will install tools for Qt development.${C_CLEAR}"
    INSTALL_QT=y
fi


h2 "Should I install tools for hardware development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for hardware development.${C_CLEAR}"
    INSTALL_HARDWARE=n
else
    echo -e "${C_GREEN}Will install tools for hardware development.${C_CLEAR}"
    INSTALL_HARDWARE=y
fi


h2 "Should I install tools for 3D development?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for 3D development.${C_CLEAR}"
    INSTALL_3D=n
else
    echo -e "${C_GREEN}Will install tools for 3D development.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_3D=y
    read -p "Install Blender? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Blender.${C_CLEAR}"
        INSTALL_BLENDER=n
    else
        echo -e "${C_GREEN}Will install Blender.${C_CLEAR}"
        INSTALL_BLENDER=y
    fi
    read -p "Install MagicaVoxel? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install MagicaVoxel.${C_CLEAR}"
        INSTALL_MAGICAVOXEL=n
    else
        echo -e "${C_GREEN}Will install MagicaVoxel.${C_CLEAR}"
        INSTALL_MAGICAVOXEL=y
    fi
    read -p "Install MakeHuman? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install MakeHuman.${C_CLEAR}"
        INSTALL_MAKEHUMAN=n
    else
        echo -e "${C_GREEN}Will install MakeHuman.${C_CLEAR}"
        INSTALL_MAKEHUMAN=y
    fi
    read -p "Install Meshlab? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Meshlab.${C_CLEAR}"
        INSTALL_MESHLAB=n
    else
        echo -e "${C_GREEN}Will install Meshlab.${C_CLEAR}"
        INSTALL_MESHLAB=y
    fi
    read -p "Install FreeCAD? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install FreeCAD.${C_CLEAR}"
        INSTALL_FREECAD=n
    else
        echo -e "${C_GREEN}Will install FreeCAD.${C_CLEAR}"
        INSTALL_FREECAD=y
    fi
    read -p "Install point cloud tools? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install point cloud tools.${C_CLEAR}"
        INSTALL_POINTCLOUD=n
    else
        echo -e "${C_GREEN}Will install point cloud tools.${C_CLEAR}"
        INSTALL_POINTCLOUD=y
    fi
fi


h2 "Should I install tools for creative coding?"
read -p "y (yes) or n (no): " USER_INPUT
if [[ "$USER_INPUT" != "y" ]]; then
    echo -e "${C_RED}Won't install tools for creative coding.${C_CLEAR}"
    INSTALL_CREATIVE=n
else
    echo -e "${C_GREEN}Will install tools for creative coding.${C_CLEAR}"
    h3 "Select tools to install."    
    INSTALL_CREATIVE=y
    read -p "Install OpenFrameworks? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install OpenFrameworks.${C_CLEAR}"
        INSTALL_OPENFRAMEWORKS=n
    else
        echo -e "${C_GREEN}Will install OpenFrameworks.${C_CLEAR}"
        INSTALL_OPENFRAMEWORKS=y
    fi
    read -p "Install Cinder? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Cinder.${C_CLEAR}"
        INSTALL_CINDER=n
    else
        echo -e "${C_GREEN}Will install Cinder.${C_CLEAR}"
        INSTALL_CINDER=y
    fi
    read -p "Install Processing? --> y (yes) or n (no): " USER_INPUT
    if [[ "$USER_INPUT" != "y" ]]; then
        echo -e "${C_RED}Won't install Processing.${C_CLEAR}"
        INSTALL_PROCESSING=n
    else
        echo -e "${C_GREEN}Will install Processing.${C_CLEAR}"
        INSTALL_PROCESSING=y
    fi
fi


echo ""
echo ""
echo -e "${C_H1}"
echo -e ""
echo -e "                               ******************"
echo -e "                               START INSTALLATION"
echo -e "                               ******************"
echo -e "${C_CLEAR}"
echo ""
echo ""


h2 "Xcode Commandline Tools"
xcode-select --install &> /dev/null
if [[ $? != 0 ]]; then
    echo -e "${C_RED}FAILED!${C_CLEAR}"
else
    echo -e "${C_GREEN}finished${C_CLEAR}"
fi


h2 "Brew Package Manager"
which brew &> /dev/null
if [[ $? != 0 ]]; then
    echo -e "${C_RED}not installed${C_CLEAR}"
    echo -e "${C_YELLOW}install brew - this might take a while ...${C_CLEAR}"
    $(/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)") &> /dev/null
else
    echo -e "${C_GREEN}already installed${C_CLEAR}"
fi


h3 "Update Brew"
echo -e "${C_YELLOW}this might take a while ...${C_CLEAR}"
brew update &> /dev/null
echo -e "${C_GREEN}finished${C_CLEAR}"


if [[ "$INSTALL_TERMINAL" != "n" ]]; then
    h2 "Install terminal tools"
    install_brew_cask iterm2
    install_brew_formula wget
    install_brew_formula git
    install_brew_formula zsh
    install_brew_formula zsh-completions
    h3 "Set ZSH as default shell"
    $(chsh -s /bin/zsh) &> /dev/null
    if [[ $? != 0 ]]; then
        echo -e "${C_RED}FAILED!${C_CLEAR}"
    else
        echo -e "${C_GREEN}finished${C_CLEAR}"
    fi
fi


if [[ "$INSTALL_UTILS" != "n" ]]; then
    h2 "Install utilities"    
    if [[ "$INSTALL_DASH" != "n" ]]; then
        install_brew_cask dash
    fi
    if [[ "$INSTALL_SOURCETREE" != "n" ]]; then
        install_brew_cask sourcetree
    fi
    if [[ "$INSTALL_APPCLEANER" != "n" ]]; then
        install_brew_cask appcleaner
    fi
    if [[ "$INSTALL_GPG" != "n" ]]; then
        install_brew_cask gpg-suite
    fi
    if [[ "$INSTALL_LITTLESNITCH" != "n" ]]; then
        install_brew_cask little-snitch
    fi
fi


if [[ "$INSTALL_MEDIA" != "n" ]]; then
    h2 "Install media tools"    
    if [[ "$INSTALL_VLC" != "n" ]]; then
        install_brew_cask vlc
    fi
    if [[ "$INSTALL_GIMP" != "n" ]]; then
        install_brew_cask gimp
    fi
    if [[ "$INSTALL_INKSCAPE" != "n" ]]; then
        install_brew_cask xquartz
        install_brew_cask inkscape
    fi
fi


if [[ "$INSTALL_ONLINE" != "n" ]]; then
    h2 "Install online tools"    
    if [[ "$INSTALL_THUNDERBIRD" != "n" ]]; then
        install_brew_cask thunderbird
    fi
    if [[ "$INSTALL_FIREFOX" != "n" ]]; then
        install_brew_cask firefox
    fi
    if [[ "$INSTALL_TOR" != "n" ]]; then
        install_brew_cask tor-browser
    fi
fi


if [[ "$INSTALL_OFFICE" != "n" ]]; then
    h2 "Install office tools"    
    if [[ "$INSTALL_LIBREOFFICE" != "n" ]]; then
        install_brew_cask libreoffice
    fi
    if [[ "$INSTALL_MACTEX" != "n" ]]; then
        install_brew_cask mactex
    fi
    if [[ "$INSTALL_TEXPAD" != "n" ]]; then
        install_brew_cask texpad
    fi
    if [[ "$INSTALL_MACDOWN" != "n" ]]; then
        install_brew_cask macdown
    fi
    if [[ "$INSTALL_MENDELEY" != "n" ]]; then
        install_brew_cask mendeley
    fi
fi


if [[ "$INSTALL_CHAT" != "n" ]]; then
    h2 "Install tools for team comunication"    
    if [[ "$INSTALL_ADIUM" != "n" ]]; then
        install_brew_cask adium
    fi
    if [[ "$INSTALL_SKYPE" != "n" ]]; then
        install_brew_cask skype
    fi
    if [[ "$INSTALL_SLACK" != "n" ]]; then
        install_brew_cask slack
    fi
fi


if [[ "$INSTALL_IDE" != "n" ]]; then
    h2 "Install IDEs"    
    if [[ "$INSTALL_ATOM" != "n" ]]; then
        install_brew_cask atom
    fi
    if [[ "$INSTALL_SUBLIMETEXT" != "n" ]]; then
        install_brew_cask sublime-text
    fi
    if [[ "$INSTALL_VISUALSTUDIO" != "n" ]]; then
        install_brew_cask visual-studio
    fi
    if [[ "$INSTALL_VISUALSTUDIOCODE" != "n" ]]; then
        install_brew_cask visual-studio-code
    fi
fi


if [[ "$INSTALL_CPP" != "n" ]]; then
    h2 "Install tools for C++ development"    
    install_brew_formula autoconf
    install_brew_formula automake
    install_brew_formula boost
    install_brew_formula cmake
    install_brew_formula cppcheck
    install_brew_formula doxygen
    install_brew_formula gcc
    install_brew_formula llvm
    install_brew_formula pkg-config
    install_brew_formula premake
    install_brew_formula swig
    install_brew_cask cmake
    if [[ "$INSTALL_CLION" != "n" ]]; then
        install_brew_cask clion
    fi
fi


if [[ "$INSTALL_PYTHON" != "n" ]]; then
    h2 "Install tools for Python development"    
    install_brew_formula python
    if [[ "$INSTALL_ANACONDA" != "n" ]]; then
        install_brew_cask anaconda
    fi
    if [[ "$INSTALL_PYCHARM" != "n" ]]; then
        install_brew_cask pycharm-ce
    fi
fi


if [[ "$INSTALL_GAME" != "n" ]]; then
    h2 "Install tools for game development"    
    if [[ "$INSTALL_EPIC" != "n" ]]; then
        install_brew_cask epic-games
    fi
    if [[ "$INSTALL_UNITY" != "n" ]]; then
        install_brew_cask unity-hub
    fi
    if [[ "$INSTALL_RIDER" != "n" ]]; then
        install_brew_cask rider
    fi
fi


if [[ "$INSTALL_ANDROID" != "n" ]]; then
    h2 "Install tools for Android development"    
    install_brew_cask android-file-transfer
    install_brew_cask android-ndk
    install_brew_cask android-platform-tools
    install_brew_cask android-sdk
    install_brew_cask android-studio
fi


if [[ "$INSTALL_QT" != "n" ]]; then
    h2 "Install tools for Qt development"    
    install_brew_formula qt
    install_brew_cask qt-creator
fi


if [[ "$INSTALL_HARDWARE" != "n" ]]; then
    h2 "Install tools for Qt hardware"    
    install_brew_cask arduino
    install_brew_cask fritzing
    install_brew_cask kicad
fi


if [[ "$INSTALL_3D" != "n" ]]; then
    h2 "Install tools for 3D development"    
    if [[ "$INSTALL_BLENDER" != "n" ]]; then
        install_brew_cask blender
    fi
    if [[ "$INSTALL_MAGICAVOXEL" != "n" ]]; then
        install_brew_cask magicavoxel
    fi
    if [[ "$INSTALL_MAKEHUMAN" != "n" ]]; then
        install_brew_cask makehuman
    fi
    if [[ "$INSTALL_MESHLAB" != "n" ]]; then
        install_brew_cask meshlab
    fi
    if [[ "$INSTALL_FREECAD" != "n" ]]; then
        install_brew_cask freecad
    fi
    if [[ "$INSTALL_POINTCLOUD" != "n" ]]; then
        install_brew_cask cloudcompare
        install_brew_formula pcl
    fi
fi


if [[ "$INSTALL_CREATIVE" != "n" ]]; then
    h2 "Install tools for creative coding"    
    if [[ "$INSTALL_OPENFRAMEWORKS" != "n" ]]; then
        install_brew_cask openframeworks
    fi
    if [[ "$INSTALL_CINDER" != "n" ]]; then
        install_brew_cask cinder
    fi
    if [[ "$INSTALL_PROCESSING" != "n" ]]; then
        install_brew_cask processing
    fi
fi


echo ""
echo -e "${C_H1}"
echo -e ""
echo -e "                               *******************"
echo -e "                               FINISHED - ENJOY ;)"
echo -e "                               *******************"
echo -e "${C_CLEAR}"
echo ""
echo -e "${C_GREEN}${INSTALLED_FORMULAE}${C_CLEAR}"
echo ""
echo -e "${C_GREEN}${INSTALLED_CASKS}${C_CLEAR}"
echo ""
