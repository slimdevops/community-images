FROM julia:latest

WORKDIR /app
COPY . .

# Run the project
CMD ["julia", "-e", "include(\"src/juliafoc.jl\")"]
