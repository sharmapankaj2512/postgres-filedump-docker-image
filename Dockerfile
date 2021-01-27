FROM postgres:13

COPY docker-entrypoint.sh /docker-entrypoint-initdb.d

RUN apt-get update && apt-get install git -y
RUN apt-get update && apt-get install make -y
RUN apt-get update && apt-get install gcc -y
RUN apt-get update && apt-get install postgresql-server-dev-13 -y

RUN git clone git://git.postgresql.org/git/pg_filedump.git
RUN cd pg_filedump && make

ENTRYPOINT ./docker-entrypoint.sh postgres