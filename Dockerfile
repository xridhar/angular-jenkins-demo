# stage 1
FROM node:latest AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# stage 2
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist/angular-jenkins-demo/browser /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
