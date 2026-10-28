FROM node:22-alpine

# Atualiza pacotes do SO Alpine e atualiza o npm global para a versão mais recente
RUN apk update && apk upgrade --no-cache && npm install -g npm@latest

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
