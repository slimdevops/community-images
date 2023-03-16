# Tells docker to use the latest Rust official image
FROM rust:latest
# Copy the project files from your machine to the container
WORKDIR /app

COPY . .
# Build your application for release, inside the container
#RUN cargo install --path .
RUN cargo build --release
# Expose the port for accessing the HTTP server within the container
EXPOSE 8001
# Run the binary built inside the container
CMD ["/app/target/release/hello_rs_docker"]
