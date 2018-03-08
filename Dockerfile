# basic container
FROM debian:testing

# labels
LABEL maintainer "Daniel Muehlbachler daniel.muehlbachler@niftyside.com"
LABEL name "LaTeX on Docker"
LABEL description "This container serves a LaTeX installation."
LABEL version "1.0.0"

# config
ENV DEBIAN_FRONTEND noninteractive


# install Java
RUN apt-get update \
  && apt-get install -y \
    wget  \
    git \
    make \
    texlive-full \
  # remove documentation for LaTeX
  && apt-get --purge remove -y .\*-doc$ \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
