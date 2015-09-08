#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2015/09/06
# @link   http://exadra37.com

    set -e;

#################################################################################################################################################################
# Declaring Vars
#################################################################################################################################################################

    declare local script_dir=$( cd "$( dirname "$0" )" && pwd );


#################################################################################################################################################################
# Source Scripts
#################################################################################################################################################################
    
    source "$script_dir/../Source/bash-colours.source.sh";


#################################################################################################################################################################
# Functions
#################################################################################################################################################################

    function isInstalled
    {
        declare local package_name="$1";

        if [ $(dpkg -s "$package_name" 2>/dev/null | grep -c "ok installed") -eq 1 ]
            then

                return 0;

        elif [ $(which "${package_name}" 2>/dev/null | grep -c "/${package_name}\$") -eq 1 ]
            then

                return 0;

        else

            # we have failed to found the package installed
            return 1;

        fi

        # TODO: find other ways to check if package is installed
        
    }

    function installPhar
    {
        declare local package_name="$1";

        declare local url="$2";

        declare local install_path="$3";

        printf "\n  >>>${bc_yellow} Installing Package $package_name ${bc_reset}->";

        if ! isInstalled "$package_name"
            then

                #sudo wget "$url" -O "$install_path";

                #sudo chmod a+x "$install_path";

                printf "${bc_green} Package $package_name was installed succesufully ${bc_reset} \n";

            else

                printf "${bc_red} Package $package_name is Already Installed ${bc_reset} \n";
        fi
    }

#################################################################################################################################################################
# Call Function
#################################################################################################################################################################

    #"$@";    
