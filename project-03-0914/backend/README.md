### Simple backend for CRUD operations on tasks 
Before start you have to have created network service `todos-net`
Edit variables in `.env`
You have two environments `dev` and `prod`. 

## Requirements
- running MySQL database for production environment

## Building background image
```bash
docker build -t todos-backend:1 .
```

## Running background container
We have to attach it to `todos-net` network and use environment file

__for production__
```bash
docker run --rm --net todos-net --env-file .env --name backend -d todos-backend:1
```

__for development__
```bash
docker run --rm --net todos-net --env-file .env.dev --name backend -d todos-backend:1
```