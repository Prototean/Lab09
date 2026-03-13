FROM node:23-bookworm-slim

WORKDIR /app

# Enable pnpm via Node's built-in corepack
RUN corepack enable pnpm

# Copy package files (using wildcard in case the lockfile is missing)
COPY package.json pnpm-lock.yaml* ./

# Install dependencies (if you add any later)
RUN pnpm install

# Copy the rest of your application code (like index.js)
COPY . .

# Expose port 3000 (assuming your app uses this port)
EXPOSE 3000

# Start the application using your main file
CMD ["node", "index.js"]