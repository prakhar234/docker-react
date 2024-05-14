#Build phase
FROM node:19-bullseye as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#RUN Phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html