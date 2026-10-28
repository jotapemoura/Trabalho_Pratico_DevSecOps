# Estágio 1: Build / Instalação de dependências
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Estágio 2: Imagem final de execução
FROM node:22-alpine

# Atualiza pacotes do SO e remove o npm/corepack globais para zerar CVEs de terceiros
RUN apk update && apk upgrade --no-cache && \
    rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/lib/node_modules/corepack \
           /opt/yarn*

WORKDIR /app

# Copia apenas o necessário do estágio de build
COPY --from=builder /app/node_modules ./node_modules
COPY . .

EXPOSE 3000

# Executa o Node diretamente sem depender do npm
CMD ["node", "index.js"]
