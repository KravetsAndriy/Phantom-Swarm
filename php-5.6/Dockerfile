FROM php:5.6-fpm

RUN apt-get update && \
	apt-get install -y libpq-dev php5-memcached libxml2-dev libmcrypt-dev

RUN docker-php-ext-install 	xml opcache session mbstring mysqli pdo mcrypt pdo_mysql pcntl json soap
RUN docker-php-ext-enable 	xml opcache session mbstring mysqli pdo mcrypt pdo_mysql pcntl json soap

RUN pecl install xdebug-2.3.2
RUN docker-php-ext-enable xdebug
RUN touch /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
	echo 'xdebug.remote_autostart=true\n\
	xdebug.remote_mode=req\n\
	xdebug.remote_handler=dbgp\n\
	xdebug.remote_connect_back=1\n\
	xdebug.remote_port=9000\n\
	# RUN echo xdebug.remote_host=127.0.0.1\n\
	xdebug.idekey=PHPSTORM\n\
	xdebug.remote_enable=1\n\
	xdebug.profiler_append=0\n\
	xdebug.profiler_enable=0\n\
	xdebug.profiler_enable_trigger=1\n\
	xdebug.profiler_output_dir=/var/debug\n\
	xdebug.profiler_output_name=cachegrind.out.%s.%u\n\
	xdebug.var_display_max_data=-1\n\
	xdebug.var_display_max_children=-1\n\
	xdebug.var_display_max_depth=-1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN apt-get install php5-mysql -y
EXPOSE 9000
CMD ["php-fpm"]