# Use an official Node.js runtime as a parent image
FROM node:22

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

RUN git clone https://github.com/miruku-39percent/Ultraviolet.git

RUN cd Ultraviolet

# Install any needed packages
RUN npm install

# Copy the rest of the application code into the working directory
COPY . .

# Build the application for production
RUN npm run build

RUN npm install https://github.com/titaniumnetwork-dev/Ultraviolet/releases/download/v1.0.1/ultraviolet-1.0.1.tgz

RUN npm pack

EXPOSE 8080
