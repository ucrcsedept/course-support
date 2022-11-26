# This container will support Node applications.
# Copy this file to the directory of your Node project.

# TODO: Support yarn, use CI, install dependencies only when needed (setup)
FROM node:latest

# Set working directory to app directory
WORKDIR /home/node/app

# Get list of dependencies, copy to current directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Get source code
COPY . .

# Bind app to port 3000
EXPOSE 3000

# Run web application
CMD [ "node", "server.js" ]