FROM swift:latest

ENV TOOLCHAINS=swift
WORKDIR /app
COPY . .
RUN swift build
EXPOSE 8080
CMD ["/app/.build/x86_64-unknown-linux-gnu/debug/hello-world"]