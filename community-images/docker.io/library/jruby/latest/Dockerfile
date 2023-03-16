FROM jruby:latest

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . /app

# Expose the server port
EXPOSE 8080

# Start the server
CMD ["ruby", "server.rb"]