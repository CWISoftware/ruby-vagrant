 #!/usr/bin/env bash
 
 source /usr/local/.nvm/nvm.sh

 nvm install $1
 nvm use $1

 echo "nvm use $1" >> /home/vagrant/.bash_profile
