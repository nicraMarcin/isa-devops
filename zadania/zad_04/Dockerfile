FROM nginx:1.21

EXPOSE 80

COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

#  2102  docker build -t zad:04 .
#  2103  docker run --rm -p 80:80 zad:04
#  2104  docker volume create isa_zadanie_04
#  2105  sudo su -< to kopiujemy html do volumenu
#  2106  docker run --rm -p 80:80 -v isa_zadanie_04:/usr/share/nginx/html zad:04
