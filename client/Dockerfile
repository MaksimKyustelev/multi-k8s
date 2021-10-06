FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
CMD npm run build 
# output is folder inside the app directory called build so we need to copy it to nginx phase of the build

FROM nginx
EXPOSE 3000
COPY ./ngingx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html