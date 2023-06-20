FROM node:lts-buster-slim

WORKDIR /react-app

# Mount the react-app volume
VOLUME .:/react-app

# Install dependencies
RUN npm install

# Build react
RUN npm run build

# Start the application
CMD npm run start