### Zadanie 4

> 1. Uruchom dowolny kontener w trybie interaktywnym. Sprawdź, jak wygląda „w środku”.
> 2. Utwórz Dockerfile bazujący na konfiguracji nginx. Zapewnij, aby serwis nginx był osiągalny z hosta.
>3. Zapewnij, aby serwis nginx udostępniał plik index.html przygotowany przez Ciebie.
>	- napisz prosty plik index.html, dodaj go do obrazu
>		- dyrektywą COPY
>		- za pośrednictwem volume
> 4. Dodaj do serwisu nginx endpoint `/status`, który zwróci kod 200 oraz  utworzoną przez Ciebie informację, np “Status: OK”, zweryfikuj działanie.

## Komendy
**Budowanie obrazu**
```shell
docker build -t zad:04 .
```
**Uruchamianie kontenera z wbudowanym `index.html`**
```shell
docker run --rm -p 80:80 zad:04
```
**Uruchamianie kontenera z podmontowanym volumenem**
```shell
docker volume create isa_zadanie_04
sudo su - #< tu kopiujemy html do volumenu
docker run --rm -p 80:80 -v isa_zadanie_04:/usr/share/nginx/html zad:04
```