FROM node:16-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod
FROM nginx:alpine
COPY --from=builder /app/dist/angular-jenkins-demo/browser /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
