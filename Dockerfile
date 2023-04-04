# Set the base image
FROM node:latest

# Set the working directory
WORKDIR /app

# Copy the application code to the working directory
COPY . .

# Install pnpm manager
# Install PM2 globally
RUN npm i -g pnpm@latest pm2

# Install dependencies
RUN pnpm install

# Expose port 3000 for the Node.js server
EXPOSE 3000

# Start the Node.js server using PM2
CMD ["pm2-runtime", "start", "dist/main.js"]