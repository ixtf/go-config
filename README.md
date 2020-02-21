
## docker 
```shell script
docker run -it --rm -v /{path}/config.yml:/config.yml --env CONFIG_PATH=/config.yml -p 1323:1323 ixtf/go-config
```

## docker-compose
```
version: "3.2"

services:
  go-config:
    image: ixtf/go-config:1.0
    restart: always
    volumes:
      - /data/mes-9200/auto/config.yml:/config.yml
    environment:
      CONFIG_PATH: /config.yml
    expose:
      - "1323"
    ports:
      - "1323:1323"
```

## cli
```shell script
curl http://localhost:1323/config
```
