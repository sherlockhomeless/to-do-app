FROM node:16.13.2-alpine as build-deps
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build-deps /usr/src/app/build/* .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]

