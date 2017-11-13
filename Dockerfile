FROM ubuntu:latest

COPY policy-rc.d /usr/sbin/policy-rc.d

RUN apt-get update  
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q  \
	apache2 \
	libapache2-mod-php7 \
	php \
	php-cli \
	php-xmlrpc \
	php-ldap \
	php-gd \
	php-mysql \
	mcrypt \
	php-mcrypt \
	unzip \
	wget \
	supervisor

RUN php5enmod mcrypt

RUN mkdir /var/www/i-doit 

# download i-doit 1.9 and upack it
RUN wget -O i-doit.zip https://sourceforge.net/projects/i-doit/files/latest/download
RUN unzip i-doit.zip -d /var/www/i-doit
RUN rm i-doit.zip

# default rights
RUN chmod +x /var/www/i-doit/idoit-rights.sh
RUN cd /var/www/i-doit && ./idoit-rights.sh

# apache2 configuration for the virtual host on port 80
# includes the alias definition for '/i-doit'
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# expose i-doit webinterface running on port 80
EXPOSE 80

# install configuration file for supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
