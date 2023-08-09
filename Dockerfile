# yahan volumes ka koi kaam nhi hai as we  don't need any sort of changes to be saved..
FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
