from   stackbrew/ubuntu:saucy
env    DEBIAN_FRONTEND noninteractive

run    apt-get install -y --force-yes software-properties-common
run    add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
run    apt-get --yes --force-yes update
run    apt-get --yes --force-yes upgrade 

run    apt-get -y --force-yes install curl git wget unzip nano build-essential autoconf
run    apt-get -y --force-yes install libxml2-dev libssl-dev libbz2-dev libcurl3-dev libdb5.1-dev libjpeg-dev libpng-dev libXpm-dev libfreetype6-dev libt1-dev libgmp3-dev libc-client-dev libldap2-dev libmcrypt-dev libmhash-dev freetds-dev libz-dev libmysqlclient15-dev ncurses-dev libpcre3-dev libsqlite-dev libaspell-dev libreadline6-dev librecode-dev libsnmp-dev libtidy-dev libxslt-dev libt1-dev
env   PHP_BUILD_VERSION 0.5
run    git clone git://github.com/wpdevtool/php-build /opt/php2build --depth 1
run    /opt/php2build/install.sh
run    php-build -i development 5.3.28 /opt/php/5.3
run    php-build -i development 5.4.26 /opt/php/5.4
run    php-build -i development 5.5.10 /opt/php/5.5
run    php-build -i development 5.6snapshot /opt/php/5.6
run    rm -rf /tmp/php-build/
run    wget https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -O /usr/bin/forego; chmod +x  /usr/bin/forego
run    apt-get autoclean