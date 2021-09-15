FROM node:12 as build
WORKDIR /app
COPY . .

RUN npm install && npm run build && cp nginx/nginx.conf build/nginx.conf

FROM nginx:1.21
WORKDIR /var/www/html

COPY --from=build /app/build ./
RUN mv nginx.conf /etc/nginx/conf.d/default.conf