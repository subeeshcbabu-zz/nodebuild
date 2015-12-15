FROM node:4.2.3

ENV WORKSPACE src
ENV PATH "/bin/:$PATH"
WORKDIR $WORKSPACE

RUN npm install -g npm@3.3.12
ADD nodebuild.sh "/bin/"

CMD [ "nodebuild.sh" ]


