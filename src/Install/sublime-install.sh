#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2015/09/06
# @link   http://exadra37.com

    set -e;

#################################################################################################################################################################
# Declaring Vars
#################################################################################################################################################################

    declare datetime=`date +%F_%H:%M:%S`;
    
    declare script_dir=$( cd "$( dirname "$0" )" && pwd );
    
    # sublime
    declare sublime_install_build="";
    declare sublime_download_link="";
    declare sublime_download_file="";
    declare sublime_hardware="amd64"; # i386
    declare sublime_bin_path="/usr/bin/sublime";
    declare sublime_install_path="/opt/sublime_text/sublime_text";


#################################################################################################################################################################
# Source Scripts
#################################################################################################################################################################
    
    source "$script_dir/../Source/bash-colours.source.sh";


#################################################################################################################################################################
# Init
#################################################################################################################################################################
    
    # http://www.sublimetext.com/3
    printf "\n${bc_yellow}Installing Sublime Text 3 ${bc_reset} \n\n";


#################################################################################################################################################################
# Get Arguments
#################################################################################################################################################################
    
    if [ "$1" ]
        then
            sublime_install_build="$1";
        else
            read -p "${bc_magenta}Sublime Build to install (ex: 3083): ${bc_reset}" sublime_install_build;

            if [ -z "$sublime_install_build" ] 
                then

                    printf "\n${bc_red}Please provide the number of the build to install. Visit http://www.sublimetext.com/3 to see the last build. ${bc_reset} \n" 

                    exit 1;
            fi
    fi

    if [ "$2" ]
        then
            sublime_bin_path="$2";
    fi

    if [ "$3" ]
        then
            sublime_install_path="$3";
    fi

    if [ "$4" ]
        then
            sublime_hardware="$4";
    fi


    sublime_download_link="http://c758482.r82.cf2.rackcdn.com/sublime-text_build-${sublime_install_build}_${sublime_hardware}.deb";

    sublime_download_file="sublime-text_build-${sublime_install_build}_${sublime_hardware}.deb";


#################################################################################################################################################################
# Start Execution
#################################################################################################################################################################

    if [ $(dpkg -s sublime-text 2>/dev/null | grep -c "ok installed") -eq 0 ]
        then

            [ -d /tmp ] || mkdir -p /tmp;

            cd /tmp;

            # downloading from link like http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
            wget "$sublime_download_link";
            
            # Installing file like "sublime-text_build-3083_amd64.deb"
            sudo dpkg -i -R "$sublime_download_file";

            # cleaning
            rm -rf "$sublime_download_file";

            # return to previous directory
            cd -;
            
            # Use fresh settings, but keep the old ones just in case
            mv "~/.config/sublime-text-3" "~/.config/sublime-text-3_$datetime";

            # symbolic link to allow open it from command line
            ln -s "$sublime_install_path" "$sublime_bin_path";

            printf "\n\n${bc_green}Sublime Text is now installed. subl${bc_reset} \n\n";

        else

            printf "\n\n${bc_red}Sublime Text is already installed. ${bc_reset} \n\n";
    fi
