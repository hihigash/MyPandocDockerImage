FROM ubuntu:18.04

# Update ubuntu
RUN apt-get update -qq
RUN apt-get upgrade -qq

RUN apt-get install -y wget
RUN wget -q https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb
RUN dpkg -i pandoc-2.2.1-1-amd64.deb

# Install texlive
RUN apt-get install -y texlive-latex-recommended

# install wkhtmltopdf
RUN apt-get install -y -qq xvfb libfontconfig wkhtmltopdf

RUN apt-get clean

VOLUME /workspace
WORKDIR /workspace
