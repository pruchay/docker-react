FROM node:alpine as builder
WORKDIR /home/node/app
COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./
RUN npm rum build

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html