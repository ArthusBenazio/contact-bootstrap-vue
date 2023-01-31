# Use a imagem oficial do node como base
FROM node:14

# Definir a pasta de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos da aplicação para o contêiner
COPY . .

# Instalar as dependências da aplicação
RUN npm install

# Expor a porta na qual a aplicação estará escutando
EXPOSE 8080

# Definir o comando padrão para iniciar a aplicação
CMD [ "npm", "run", "serve" ]
