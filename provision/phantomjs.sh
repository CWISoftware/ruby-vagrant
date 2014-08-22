 #!/usr/bin/env bash
echo '----------------------------------------------'
echo ' INSTALLING PHANTOMJS'
echo '----------------------------------------------'

cd /usr/local/src
wget 'https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2'
tar xvf phantomjs-1.9.7-linux-x86_64.tar.bz2
cp phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin