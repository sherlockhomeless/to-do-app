FROM node:16.13.2-alpine as build-deps
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build
EXPOSE 3000
ENTRYPOINT ["yarn", "start"]

