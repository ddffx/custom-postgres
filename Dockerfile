FROM postgres
# RUN mkdir p /usr/src/sql
# COPY ./init-db.sql /usr/src/sql/init-db.sql
ADD ./init-db.sh /docker-entrypoint-initdb.d/
# ADD ./init-db.sql /docker-entrypoint-initdb.d/init-db.sql
RUN chmod 755 /docker-entrypoint-initdb.d/init-db.sh 