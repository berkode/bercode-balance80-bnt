#############
# Should be the specific version of node:alpine3.
FROM node:14.15.5-buster@sha256:28b64286eb60f8b14112c9d3900a826743796b0efe04344c8a25371d56ac6b86 AS production

ENV PORT 8080 

ENV HOST 0.0.0.0

WORKDIR /srv/app

COPY ./package.json ./package-lock.json ./

RUN npm install --only=production

# Copy the local code to the container
COPY . .

# Build production app
#RUN npm run Build

# Start the website
#CMD npm start

# Start the trader
#CMD npm run start

CMD docker run -d -p 8003:8080 -v "$PWD/.env:/srv/app/.env" gcr.io/bercode-nbt/nbt:${SHORT_SHA} npm run trader