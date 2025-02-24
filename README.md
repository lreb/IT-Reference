# JobOrchestration

Import DB
```bash
s
```


Setup secrets
Create a .env file in the same directory as docker-compose.yml
```bash
DB_HOST=<localhost_ip>
DB_USER=<user>
DB_PASS=<password>
DB_NAME=<databse_name>
DB_PORT=<port>
```

run wiki container

```bash
docker compose up -d
```


use wiki

port: 80
```bash
http://localhost
```