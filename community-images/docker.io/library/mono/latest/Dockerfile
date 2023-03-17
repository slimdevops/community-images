FROM mono:latest
RUN mkdir /opt/app
COPY src/hello.cs /opt/app
WORKDIR /opt/app
RUN mcs hello.cs
CMD ["mono", "/opt/app/hello.exe"]
