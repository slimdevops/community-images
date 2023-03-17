FROM groovy:latest

SHELL ["/bin/bash", "-c"]

USER root
WORKDIR /home/groovy

RUN apt-get update \
    && apt-get clean \
    && apt-get install -y curl \
    && apt-get install zip \
    && curl -s "https://get.sdkman.io" | bash \
    && source "/root/.sdkman/bin/sdkman-init.sh" \
    && sdk install grails 

COPY slim-sample-app ./slim-sample-app

# RUN /root/.sdkman/candidates/grails/current/bin/grails --version
RUN export PATH=/root/.sdkman/candidates/grails/current/bin:$PATH \
    &&  echo $PATH && grails --version && cd slim-sample-app && grails war 

CMD java -Dgrails.env=prod -jar slim-sample-app/build/libs/slim-sample-app-0.1.war
# CMD [ "java -Dgrails.env=prod -jar libs/slim-sample-app-0.1.war"  ]
# RUN java -version
# RUN source ~/.bashrc


