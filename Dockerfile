# Stage 1: Build the React application
FROM node:17 AS build

WORKDIR /home/bhavani/react1


# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the built React application using Nginx
FROM nginx:alpine

# Copy the build output from the previous stage
COPY --from=build /home/bhavani/react1/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
