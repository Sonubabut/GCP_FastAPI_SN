# Stage 1: Build the React app
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code
COPY . .

# Build the production version of the React app
RUN npm run build

# Stage 2: Serve the React app with nginx
FROM nginx:stable-alpine

# Copy the built files to the nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port for Cloud Run
EXPOSE 8080

# Set the default port for Cloud Run
ENV PORT=8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
