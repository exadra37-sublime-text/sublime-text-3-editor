#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2015/09/07
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
    source "$script_dir/../Source/Functions/packages.source.sh";


#################################################################################################################################################################
# Init
#################################################################################################################################################################
    
    # http://www.sublimetext.com/3
    printf "\n ${bc_magenta} Installing Sublime Text 3 Dependencies ${bc_reset} \n\n";


#################################################################################################################################################################
# Functions
#################################################################################################################################################################

    #sudo apt-get -y update

    # https://github.com/squizlabs/PHP_CodeSniffer
    function phpcs 
    {
        declare local package_name="phpcs";

        declare local url="https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar";

        declare local install_path="/usr/local/bin/phpcs";

        installPhar "$package_name" "$url" "$install_path";
    }

    # https://github.com/squizlabs/PHP_CodeSniffer
    function phpcbf
    {
        declare local package_name="phpcs";

        declare local url="https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar";

        declare local install_path="/usr/local/bin/phpcbf";

        installPhar "$package_name" "$url" "$install_path";
    }

    # https://github.com/FriendsOfPHP/PHP-CS-Fixer
    function php-cs-fixer
    {
        declare local package_name="phpcs";

        declare local url="http://get.sensiolabs.org/php-cs-fixer.phar";

        declare local install_path="/usr/local/bin/php-cs-fixer";

        installPhar "$package_name" "$url" "$install_path";
    }

    # http://phpmd.org/download/index.html
    function phpmd
    {
        declare local package_name="phpcs";

        declare local url="https://static.phpmd.org/php/latest/phpmd.phar";

        declare local install_path="/usr/local/bin/phpmd";

        # http://howto.biapy.com/fr/ubuntu-gnu-linux/developpement/installer-phpmd-sur-ubuntu
        # Accordling with above tutorial we may need to install:
        #  sudo apt-get -y install php5-imagick php5-dev build-essential

        installPhar "$package_name" "$url" "$install_path";
    }

    # http://pdepend.org/
    function pdepend
    {
        declare local package_name="phpcs";

        declare local url="https://static.pdepend.org/php/latest/pdepend.phar";

        declare local install_path="/usr/local/bin/pdepend";

        installPhar "$package_name" "$url" "$install_path";
    }

    # http://stackoverflow.com/a/25028478
    function sheck 
    {
        printf "\n ${bc_yellow} Installing Package Sheck ${bc_reset} \n";

        cd /opt/;

        sudo git clone --depth=1 https://github.com/facebook/pfff.git;
        sudo ./configure;
        sudo make depend;
        sudo make;
        sudo make opt;

        cd -;

        printf "\n ${bc_green} Package Sheck was installed succesufully ${bc_reset} \n";
    }

#################################################################################################################################################################
# Get Arguments
#################################################################################################################################################################
    
    "$@";
