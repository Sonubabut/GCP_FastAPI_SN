# Stage 1: Build the React app
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code
COPY . .

# Build the React app for production
RUN npm run build

# Stage 2: Serve the React app using a lightweight web server
FROM nginx:stable-alpine

# Copy the built React app to the nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port for the container
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
