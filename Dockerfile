#Phase 1
FROM node:alpine

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

#2nd phase elasticbeanstalk will look for the expose command to route traffic from port 80
FROM nginx
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html
#Only take everything from your app/build and dump it into nginx html
#NGINX is a great tool for handling production grade traffic.