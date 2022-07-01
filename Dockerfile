## declare base image - node 16
FROM node:16.14.2 AS builder
## make work directory and copy files
WORKDIR /app
COPY . .
## project dependency install
RUN yarn
RUN yarn run build

FROM node:16.14.2-alpine
WORKDIR /usr/src/app
COPY --from=builder /app ./

EXPOSE 3000
CMD yarn start:prod