# This container will support Node applications.
FROM node:latest

# Set working directory to app directory
WORKDIR /home/node/app

# Get list of dependencies, copy to current directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Get source code
COPY . .

# Run web application
CMD [ "node", "server.js" ]