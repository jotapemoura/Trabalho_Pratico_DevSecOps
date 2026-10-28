FROM node:22-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
