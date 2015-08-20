FROM node:0.10.40

ENV WORKSPACE src
ENV PATH "/bin/:$PATH"
WORKDIR $WORKSPACE

ADD nodebuild.sh "/bin/"

CMD [ "nodebuild.sh" ]


