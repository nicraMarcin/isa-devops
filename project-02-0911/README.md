
> 1. Zapewnij połączenie pomiędzy dwoma kontenerami - nginx oraz odpytującego dany endpoint:
> 	- utwórz sieć „my-network”,
> 	- dostosuj skrypt odpytujący endpoint tak, aby odpytywał cyklicznie z zadaną > częstotliwością (domyślnie 5 sekund)
> 	- uruchom obydwa utworzone serwisy w tej sieci tak, aby serwis odpytujący dowolny > endpoint zapytał serwis nginx
> 	- z którego parametru skorzystasz - expose, czy port dla serwisu nginx? Dlaczego?
> 2. Utwórz dwa pliki Dockerfile oraz niezbędne skrypty.
> 	- kontener na podstawie pierwszego Dockerfile powinien w pętli pisać do pliku
> 	- kontener na podstawie drugiego Dockerfile powinien w pętli czytać z pliku
> 	- plik powinien być udostępniony za pośrednictwem volume
> 3. Uruchom kontener z bazą danych, skomunikuj się z nią z hosta/VM (możesz skorzystać z > konfiguracji z projektu pierwszego).

## tworzymy sieć i wolumen na potrzeby zadań
```shell
docker network create my-network
docker volume create isa-proj-02
```
### Zadanie 1
**budujemy i uruchamiamy nginx z endpointem `/status`**
```shell
docker build -t service-nginx:1 -f Dockerfile-nginx .
docker run --name nginx.host --net my-network service-nginx:1
```

**Budujemy i uruchamiamy kontener ze skryptem wykonyjącym co 5s zapytanie do /status**
```shell
docker build -t service-asker:1 -f Dockerfile-asker .
docker run --rm --net my-network service-asker:1
```

### Zadanie 2
**Budujemy i uruchamiamy serwis piszący do `/data/data.log`. Wykorzystujemy wolumen `isa-proj-02`**
```shell
docker build -t service-writer:1 -f Dockerfile-writer .
docker run --rm -v isa-proj-02:/data service-writer:1
```

**Budujemy i uruchamiamy serwis czytający `/data/data.log`. Wykorzystujemy wolumen `isa-proj-02`**
```shell
docker build -f Dockerfile-reader -t service-reader:1 .
docker run --rm -v isa-proj-02:/data service-reader:1
```

### Zadanie 3
**Uruchamiamy kontener z bazą PostgreSQL u dajemy hasło `postgres` użytkownikowi `postgress`**
```shell
docker run --net my-network --name db-postgres -e POSTGRES_PASSWORD=postgres -d postgres:13
```

**Dla testu próbujemy się zalogować do naszej bazy**
```shell
docker run -it --rm --net my-network postgres:13 psql -h db-postgres -U postgres
```