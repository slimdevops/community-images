FROM clojure:latest

WORKDIR /app
# Copy the application code
COPY . .

# Expose the server port
EXPOSE 8080

# Start the server
CMD ["lein", "run","-m","hello-world.core"]
