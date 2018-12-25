#This is a multi-phase docker file used on production

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#nginx starts itself