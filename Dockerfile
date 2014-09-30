from   ubuntu:14.04
env    DEBIAN_FRONTEND noninteractive
env    PHP_BUILD_VERSION 0.6

run rm /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse' >> /etc/apt/sources.list; \
	apt-get -y --force-yes update; \
	apt-get -y --force-yes upgrade; \
	apt-get -y --force-yes install software-properties-common curl git wget unzip nano build-essential autoconf libxml2-dev libssl-dev libbz2-dev libcurl3-dev libdb5.1-dev libjpeg-dev libpng-dev libXpm-dev libfreetype6-dev libt1-dev libgmp3-dev libc-client-dev libldap2-dev libmcrypt-dev libmhash-dev freetds-dev libz-dev libmysqlclient15-dev ncurses-dev libpcre3-dev libsqlite-dev libaspell-dev libreadline6-dev librecode-dev libsnmp-dev libtidy-dev libxslt-dev libt1-dev; \
	apt-get autoclean;

run    git clone https://github.com/CHH/php-build.git /opt/php2build --depth 1
run    /opt/php2build/install.sh
run    php-build -i development 5.3.29 /opt/php/5.3
run    php-build -i development 5.4.33 /opt/php/5.4
run    php-build -i development 5.5.17 /opt/php/5.5
run    php-build -i development 5.6.0 /opt/php/5.6
run    wget https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -O /usr/bin/forego; chmod +x  /usr/bin/forego
