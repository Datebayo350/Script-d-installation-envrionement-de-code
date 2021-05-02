#!bin/bash
# TO RUN THIS SCRIPT USE : bash installation.sh
# Github: Datebayo350 
# ENVIRONMENT OF DEVELOPMENT INSTALLATION SCRIPT /V1.0
# This is acommentary, comment lignes you don't want to execute.

 bold=`echo -en "\e[1m"`
 underline=`echo -en "\e[4m"`
 dim=`echo -en "\e[2m"`
 strickthrough=`echo -en "\e[9m"`
 blink=`echo -en "\e[5m"`
 reverse=`echo -en "\e[7m"`
 hidden=`echo -en "\e[8m"`
 normal=`echo -en "\e[0m"`
 black=`echo -en "\e[30m"`
 red=`echo -en "\e[31m"`
 green=`echo -en "\e[32m"`
 yellow=`echo -en "\e[33m"`
 blue=`echo -en "\e[34m"`
 purple=`echo -en "\e[35m"`
 aqua=`echo -en "\e[36m"`
 gray=`echo -en "\e[37m"`
 darkgray=`echo -en "\e[90m"`
 lightred=`echo -en "\e[91m"`
 lightgreen=`echo -en "\e[92m"`
 lightyellow=`echo -en "\e[93m"`
 lightblue=`echo -en "\e[94m"`
 lightpurple=`echo -en "\e[95m"`
 lightaqua=`echo -en "\e[96m"`
 white=`echo -en "\e[97m"`
 default=`echo -en "\e[39m"`
 BLACK=`echo -en "\e[40m"`
 RED=`echo -en "\e[41m"`
 GREEN=`echo -en "\e[42m"`
 YELLOW=`echo -en "\e[43m"`
 BLUE=`echo -en "\e[44m"`
 PURPLE=`echo -en "\e[45m"`
 AQUA=`echo -en "\e[46m"`
 GRAY=`echo -en "\e[47m"`
 DARKGRAY=`echo -en "\e[100m"`
 LIGHTRED=`echo -en "\e[101m"`
 LIGHTgreen=`echo -en "\e[102m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 LIGHTBLUE=`echo -en "\e[104m"`
 LIGHTPURPLE=`echo -en "\e[105m"`
 LIGHTAQUA=`echo -en "\e[106m"`
 WHITE=`echo -en "\e[107m"`
 DEFAULT=`echo -en "\e[49m"`

# Update and Upgrade packages already presents on the machine.
sudo apt-get update -y;
sudo apt-get upgrade -y;

# Apche2 server - Installation
sudo apt-get install -y apache2;
sudo a2enmod rewrite;

# Git - Installation 
sudo apt-get install -y git;

# PHP 7.4 - Installation, and also of his useful librairies
sudo apt-get install -y php php-mysql php-mbstring php-xml;

# Mariadb (Opensource and maintened version of MySQL) - Installation
sudo apt-get install -y mariadb-server;

# NVM - Installation Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash;

# NodeJS - Installation of the current LTS version: 14.16.1
nvm install 14.16.1;

# Npm - Installation Node Packages Manager
sudo apt-get install -y npm;

# Yarn - Installation to the global scope, an other useful NodeJS Package Manager 
# Errors1: npm WARN checkPermissions Missing write access to /usr/local/lib => https://flaviocopes.com/npm-fix-missing-write-access-error/
# Error2: code EACCES stscakk symlink node_odules => https://stackoverflow.com/questions/14786565/npm-error-when-installing-globally-even-when-directories-are-writable
sudo chown -R $USER /usr/local/lib/;
sudo npm install -g yarn;

# TypeScript - Installation to the global scop
sudo npm install -g typescript;

# MongoDB - Installation for Ubuntu v.20.04 LTS, won't work correctly on actual (may-2021) WSL 2 
# MongoDB - Installation for Windows refer to the official doc : https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/
#wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -;
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list;
#sudo apt-get update;
#sudo apt-get install -y mongodb-org;
#sudo service mongod start;
#sudo service mongod status;

# Adminer 4.8.0 (Grafic interface for Databases) - Installation
sudo touch adminer.css;
sudo mkdir adminer;
sudo wget https://github.com/vrana/adminer/releases/download/v4.8.0/adminer-4.8.0.php;
printf "\n \n";

# SSH - Generation of the public / private SSH keys for the current shell user
printf "${red}GENERATION OF YOUR SSH KEYS, FOR YOUR DAILY COMFORT RUN $normal ${green} 'enter' $normal ${red}DURING ALL THE PROCESS $normal \n \n";
ssh-keygen -t rsa;
eval `ssh-agent -s`;
ssh-add ~/.ssh/id_rsa;
printf "\n \n";

#Messages - DIY Instructions
printf "${YELOW}/// SSH /// $normal \n
${red}THE FOLLOWING STEPS WILL ALWAYS ADD THE SSH KEY TO THE NEW PID PROFIL WHEN YOU OPEN A NEW TERMINAL, SO YOU'll BE ALWAYS KNOWNED BY GITHUB, START BY OPENING : $normal \n 
${green}'code ~/.bashrc' $normal \n
${red}AND ADD THESE 2 COMMANDS AT THE BOTTOM OF THE FILE : $normal \n
${green}2) ' eval `ssh-agent -s` ' $normal \n
${green}3) ' ssh-add ~/.ssh/id_rsa ' $normal \n
${red}YOU CAN LINK YOUR GITHUB WITH YOUR LOCAL GIT VIA SSH, THE CONTENT OF YOUR KEY ARE SITUED IN $normal \n
${green}'~/.ssh id_rsa.pub' $normal \n \n";

printf "${YELLOW}/// ADMINER /// $normal \n
${red}PLEASE COPY THE CODE FOUND WHEN FOLLOWING THIS LINK AND PASTE IT, INTO $normal ${green}adminer.css $normal ${red}IF YOU DESIRE NICE CUSTOM STYLE $normal \n
${blue}https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css $normal \n \n";

printf "${YELLOW}/// DATABASE /// $normal \n
${red}PLEASE CREATE A SUPER USER FOR YOUR DATABASE WITH THE FOLLOWING COMMANDS: $normal \n
${green}1) sudo mysql \n
2) CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'; \n
3) GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION; $normal \n \n";

printf "${YELLOW}/// APACHE2 /// $normal \n
${red}PLEASE GO INTO $normal ${green}' /etc/apache2/apache2.conf ' $normal ${red} FIND THE SECTION $normal \n
${green}' <Directory /var/www> ' $normal ${red} AND SET THE VALUE OF $normal ${green}AllowOverride $normal ${red}TO $normal ${green}All $normal \n 
${red} THEN CHANGE THE RIGHTS OF THE DOCUMENT ROOT DIRECTORY ' html ' WITH THE FOLLOWING COMMAND: $normal \n
${green} sudo chown -R 'username':www-data /var/www/html \n \n" ;

# Start Installed Services
sudo apt-get update -y;
sudo apt-get updgrade -y;
sudo service apache2 restart;
sudo service mysql restart;
