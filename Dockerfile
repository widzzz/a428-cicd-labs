FROM node:lts-buster-slim

WORKDIR /usr/react-app

# Mount the react-app volume
VOLUME .:/usr/

# Install dependencies
RUN npm install

# Build react
RUN npm run build

# Start the application
CMD npm run start