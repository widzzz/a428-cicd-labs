FROM node:lts-buster-slim

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json /app

# Install dependencies
RUN npm install

# Copy the rest of the application code from the local directory to the container
COPY . /app

# Build react
# RUN npm run build

# Start the application
CMD npm run start