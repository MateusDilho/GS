
Equipe:
Guilherme Zapater  RM88080
Mateus Dilho Alves RM89205

### Vamos lá professor passo 1: Construir a Imagem do Aplicativo Node.js
Primeiro, construa a imagem Docker do aplicativo Node.js:

docker build -t app-node .

### Passo 2: Iniciar o Container MySQL
docker run --name database-mysql -v /db/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123 -p 3306:3306 -d mysql

### Passo 3: Configurar o Banco de Dados MySQL
docker exec -it database-mysql /bin/bash
mysql -uroot -p123

### Passo 4: Inserir os comandos SQL
Insira os comando do arquivo script.sql
em seguida execute
exit
exit

### Passo 5: Iniciar o Container do Aplicativo Node.js
docker run -p 3000:3000 -d --rm --name node-container --link database-mysql app-node

Agora a aplicação vai estar rodando na rota http://localhost:3000, para testar as rotas acesse os seguintes endpoints:
- http://localhost:3000/objetivos
- http://localhost:3000/indicador/3.1.1

Obs. apenas o 3.1.1 está populado com dados

