FROM haskell:latest

WORKDIR /opt/server
RUN cabal update
COPY . .
RUN cabal configure
RUN cabal build

WORKDIR /app
RUN cp -r $(ls -d /opt/server/dist-*/build/*/ghc-*/MyServer-*/*/my-server/build/my-server) /app/
EXPOSE 8080

CMD ["/app/my-server/my-server"]
