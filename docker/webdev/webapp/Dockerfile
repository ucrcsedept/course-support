# This container will support Node applications.
# Copy this file to the directory of your Node project.
FROM node:latest

# Set working directory to app directory
WORKDIR /home/node/app

# Get list of dependencies, copy to current directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Get source code
COPY . .

# Bind app to port 8000
EXPOSE 8000

# Run web application
CMD [ "node", "server.js" ]