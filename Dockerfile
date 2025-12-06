# Stage 1: Build the application
FROM node:18-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./

# 'npm ci' is faster/cleaner for CI/CD than 'npm install'
RUN npm ci

# Copy source code
COPY . .

# Build for production (Creates 'dist' folder)
RUN npm run build

# Stage 2: Serve using Nginx
FROM nginx:stable-alpine

# Copy the built React app
COPY --from=build /app/dist /usr/share/nginx/html

# --- NEW: Copy our custom Nginx config ---
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]