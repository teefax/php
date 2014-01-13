from   base
env    DEBIAN_FRONTEND noninteractive

run    dpkg-divert --local --rename --add /sbin/initctl
run    ln -s /bin/true /sbin/initctl

run    apt-get install -y -q software-properties-common
run    add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
run    apt-get --yes update
run    apt-get --yes upgrade --force-yes

run    echo "mysql-server mysql-server/root_password password docker" | debconf-set-selections
run    echo "mysql-server mysql-server/root_password_again password docker" | debconf-set-selections

run    apt-get -y --force-yes install mysql-server mysql-client pwgen python-setuptools curl git wget unzip nano
run    apt-get -y --force-yes install build-essential
run    apt-get -y --force-yes install libxml2-dev libssl-dev libbz2-dev libcurl3-dev libdb5.1-dev libjpeg-dev libpng-dev libXpm-dev libfreetype6-dev libt1-dev libgmp3-dev libc-client-dev libldap2-dev libmcrypt-dev libmhash-dev freetds-dev libz-dev libmysqlclient15-dev ncurses-dev libpcre3-dev libsqlite-dev libaspell-dev libreadline6-dev librecode-dev libsnmp-dev libtidy-dev libxslt-dev libt1-dev
run    git clone git://github.com/CHH/php-build /opt/php-build --depth 1
run    /opt/php-build/install.sh
run    php-build -i development --pear 5.3.28 /opt/php/5.3
run    php-build -i development --pear 5.4.24 /opt/php/5.4
run    php-build -i development --pear 5.5.8 /opt/php/5.5