FROM node:12.18.2

RUN mkdir -p /app
WORKDIR /app

# Copy only the required files for package installation
ADD sample/package.json sample/package-lock.json /app/

# Download and install npm packages
RUN npm install
