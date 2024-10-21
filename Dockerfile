# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /sim-app

# Copy package.json and package-lock.json if available
COPY ../package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Expose the port that your app runs on
EXPOSE 5001

# Command to run your application
CMD ["node", "server.js"]
