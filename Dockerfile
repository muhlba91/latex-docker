# basic container
FROM debian:testing

# argument
ARG VERSION="2018.20190227-2"

# labels
LABEL maintainer "Daniel Muehlbachler daniel.muehlbachler@niftyside.com"
LABEL name "LaTeX on Docker"
LABEL description "This container serves a LaTeX installation."
LABEL version $VERSION

# config
ENV DEBIAN_FRONTEND noninteractive
ENV LATEX_VERSION $VERSION

# install latex
RUN apt-get update \
  && apt-get install -y \
    wget  \
    git \
    make \
    texlive-full=$LATEX_VERSION \
  && apt-get --purge remove -y .\*-doc$ \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
