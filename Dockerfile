# basic container
FROM alpine:3.11

# argument
ARG VERSION="20190410-r12"

# labels
LABEL maintainer "Daniel Muehlbachler daniel.muehlbachler@niftyside.com"
LABEL name "LaTeX on Docker"
LABEL description "This container serves a LaTeX installation."
LABEL version $VERSION

# config
ENV LATEX_VERSION $VERSION

# install latex
RUN apk update \
  && apk add --no-cache biber \
    wget  \
    git \
    make \
    texlive-full=$LATEX_VERSION \
  && rm -rf /var/cache/apk/*

