# Use the official Node.js 18 image as the base image
FROM node:18

# Create app directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire source code into the container
COPY . .

# The app will run on port 3000
EXPOSE 3000

# Command to run the app
CMD ["node", "index.js"]
