FROM node:lts-buster-slim

WORKDIR /usr/app

# Mount the react-app volume
VOLUME /react-app

# Install dependencies
RUN npm install

# Start the application
CMD npm start