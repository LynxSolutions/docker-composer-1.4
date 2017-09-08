# Pull base image.
FROM composer:1.4
MAINTAINER Nimrod Nagy <nimrod.nagy@lynxsolutions.eu>

# Latest Git version
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list

# Install rsync for deployment
RUN apt-get update  \
  && apt-get install -y openssh-client rsync libssl-dev zlib1g-dev libicu-dev g++ git \
  && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure intl

#install mysql pdo
RUN docker-php-ext-install pdo pdo_mysql bcmath soap

#install mongodb php extension
RUN pecl install mongodb-1.2.9 \
  && docker-php-ext-enable mongodb

# Set correct entrypoint
CMD ["/bin/bash"]
ENTRYPOINT []
