# Use public MariaDB 10.5 image
FROM mariadb:10.5

# needed for initialization
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=pass
ENV MYSQL_DATABASE=qod

# Copy our sql scripts
COPY 1_createdb.sql /docker-entrypoint-initdb.d/
COPY 2_authors.sql /docker-entrypoint-initdb.d/
COPY 3_genres.sql /docker-entrypoint-initdb.d/
COPY 4_quotes_sm.sql /docker-entrypoint-initdb.d/

# Copy custom init script
COPY run.sh /docker-entrypoint-initdb.d/

# Expose the MariaDB port
EXPOSE 3306
