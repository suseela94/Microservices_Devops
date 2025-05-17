# Use the official node image as the base image
FROM alpine:3.20

ENV NODE_VERSION 24.0.2

# Set the working directory
WORKDIR /Users/Admin/Documents/microservices project

# Copy the requirements file into the container
COPY requirements.txt .

# Install any necessary dependencies
RUN npm install -g , npm update

# Copy the rest of theapplication code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 8080

# Start the application
CMD ["node", "patient-service.js","appointment-service.js"]
