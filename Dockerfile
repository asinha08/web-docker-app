FROM node:alpine as web_builder
WORKDIR /app
COPY ./package.json ./
RUN yarn install
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=web_builder /app/build /usr/share/nginx/html