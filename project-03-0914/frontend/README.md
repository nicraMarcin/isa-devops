### Simple frontend application used for tasks management (currently Read only).

Before start you have to have created network service `todos-net`
Edit variables in `.env`

## Requirements
- running backend

## Building background image
```bash
docker build -t todos-front:1 .
```

## Running container
```bash
docker run --rm --net todos-net --name todos-front -p 80:80 -d todos-front:1
```
