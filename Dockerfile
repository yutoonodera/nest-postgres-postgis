# Dockerfile
FROM node:20-alpine

WORKDIR /app

# 依存関係だけ先にコピー（キャッシュ効く）
COPY package*.json ./
RUN npm ci

# ソース
COPY . .

# Nestの開発サーバ（ホットリロード）
EXPOSE 3000
CMD ["npm", "run", "start:dev"]

