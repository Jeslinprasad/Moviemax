# First stage: Builder
FROM node:16.17.0-alpine as builder

WORKDIR /app

COPY ./package.json .

RUN yarn install

COPY . .

ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"

RUN yarn build

# Second stage: Serve using Nginx
FROM nginx:stable-alpine

# Copy built app to Nginx directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# No need for ENTRYPOINT, the default command of the nginx image starts nginx
