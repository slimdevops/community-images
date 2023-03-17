FROM mono:latest
RUN mkdir /opt/app
COPY hello.exe /opt/app
COPY hello.aspx /opt/app
WORKDIR /opt/app
CMD ["mono", "/opt/app/hello.exe"]
