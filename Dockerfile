FROM postgres

ADD ./init-db.sh /docker-entrypoint-initdb.d/
# ADD ./init-db.sql /docker-entrypoint-initdb.d/init-db.sql
