psql -U postgres -d postgres -c 'create table t_random as select s, now() from generate_Series(1,500) s; checkpoint;'
oid=`psql -X -A -d postgres -U postgres -t -c "SELECT relfilenode FROM pg_class WHERE relname = 't_random';"`
path=$(find $PGDATA -type f | grep $oid)
echo $oid
echo $path 
/pg_filedump/pg_filedump -D int,timestamp $path > /tmp/t_random_page_dump
