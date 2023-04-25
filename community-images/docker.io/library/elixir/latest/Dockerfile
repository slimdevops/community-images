FROM elixir:latest as build


RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app
#Copy the source folder into the Docker image
COPY . .

#Install dependencies and build Release
RUN export MIX_ENV=prod && \
    rm -Rf _build && \
    mix deps.get && \
    mix release


FROM elixir:latest

#Set environment variables and expose port
EXPOSE 4000
ENV REPLACE_OS_VARS=true \
    PORT=4000

WORKDIR /app
#Copy and extract .tar.gz Release file from the previous stage
COPY --from=build /app/_build/prod/rel/hello_world ./
#Set default entrypoint and command
ENTRYPOINT ["/app/bin/hello_world", "start"]
CMD ["foreground"]