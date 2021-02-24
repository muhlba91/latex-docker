# basic container
FROM alpine:edge

# labels
LABEL maintainer "Daniel Muehlbachler-Pietrzykowski daniel.muehlbachler@niftyside.com"
LABEL name "LaTeX in a container"

# config
ENV LATEX_VERSION "20200406-r8"

# install latex
RUN apk update \
  && apk add --no-cache biber \
    wget  \
    git \
    make \
    texlive-full=$LATEX_VERSION \
  && rm -rf /var/cache/apk/*
