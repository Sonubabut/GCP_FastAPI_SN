# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Install TypeScript globally
RUN npm install --force

# Compile TypeScript to JavaScript
RUN npm run build

# Specify the command to run the application
CMD ["node", "dist/app.js"]

# Expose the port the app runs on
EXPOSE 3000
