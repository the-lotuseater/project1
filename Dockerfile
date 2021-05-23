#Phase 1
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#2nd phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#Only take everything from your app/build and dump it into nginx html