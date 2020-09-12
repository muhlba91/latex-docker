# basic container
FROM alpine:edge

# argument
ARG VERSION="20200406-r2"

# labels
LABEL maintainer "Daniel Muehlbachler-Pietrzykowski daniel.muehlbachler@niftyside.com"
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

