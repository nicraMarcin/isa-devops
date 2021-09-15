FROM mysql:5.7
# WORKDIR /app
VOLUME [ "/var/lib/mysql" ]

COPY data.sql /docker-entrypoint-initdb.d/initial.sql

