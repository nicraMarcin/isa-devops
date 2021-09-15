## Database image for todos service task

**You should create network service named `todos-net`**

This Dockerfile exposes volume for database files. When you dont specify explicitly 
volume to mount docker will create anonymous volume while starting. 
First container's start reaads `.sql` files located in `/docker-entrypoint-initdb.d` directory.

## Building image
```bash
docker build -t todos-db:1.0 .
```

## Runing container with .env 
**Attaching it to `todos-net` and naming it as `db.local`**

```bash
docker run --rm --net todos-net --env-file .env --name db.local -d todos-db:1.0
```
This will remove anonymous volume when container is removed.
To preserve data create volume for database data.
```shell
docker volume create todos-data
docker run --rm --net todos-net --name db.local --env-file .env -v todos-data:/var/lib/mysql -d todos-db:1.0
```

