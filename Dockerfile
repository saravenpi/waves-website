# Build stage
FROM oven/bun:1 AS builder

WORKDIR /app

# Copy package files
COPY package.json bun.lockb* ./

# Install dependencies
RUN bun install --frozen-lockfile

# Copy source files
COPY . .

# Build the application
RUN bun run build

# Production stage - serve with nginx
FROM nginx:alpine

# Copy built files to nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
