FROM alekzonder/puppeteer

USER root

# Install cabel using ghcup

ENV LANG C.UTF-8
ENV CABAL_WORKDIR="/root"

RUN apt-get update \
    && apt-get install -y build-essential curl git libgmp-dev libffi-dev libncurses-dev libtinfo5 zlib1g-dev
RUN curl https://get-ghcup.haskell.org -sSf | sh

ENV PATH="${CABAL_WORKDIR}/.ghcup/bin:${CABAL_WORKDIR}/.cabal/bin:$PATH"

WORKDIR ${CABAL_WORKDIR}
RUN cabal new-update

# install pandoc and haskell's filters
RUN cabal new-install pandoc
RUN cabal new-install pandoc-citeproc pandoc-crossref

# install lexlive and wkhtmltopdf (for pdf)
RUN apt-get update \
    && apt-get install -y texlive-latex-recommended xvfb libfontconfig wkhtmltopdf

# install mermaid-filter
RUN npm install mermaid-filter
ENV PATH /root/node_modules/.bin:$PATH

VOLUME /workspace
WORKDIR /workspace
