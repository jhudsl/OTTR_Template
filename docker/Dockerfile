FROM rocker/tidyverse:4.0.2
LABEL maintainer="cansav09@gmail.com"
WORKDIR /rocker-build/

COPY install_github.R .

# Install apt-getable packages to start
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils dialog

# These packages are dependencies
RUN apt-get install -y --no-install-recommends \
    libxt6 \
    libpoppler-cpp-dev \
    cabal-install \
    imagemagick \
    librsvg2-bin \
    librsvg2-common \
    zlib1g \
    zlib1g-dev

# Add curl, bzip2 and pandoc
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    bzip2 \
    curl

RUN echo "Initial update." &&\
    apt-get update &&\
# install tzdata, which we will need down the line
    apt-get install -f -y --no-install-recommends tzdata &&\
    echo "Now installing cabal, imagemagick, and other tools." &&\
# We install cabal, a Haskell package manager, because we want the newest
# pandoc and filters which we can only get from there.
# We also install zlib1g, as we will need it later on.
# We install librsvg2 in order to make svg -> pdf conversation possible.
# imagemagick may be needed by the latex-formulae-pandoc filter
    apt-get install -f -y --no-install-recommends \
      cabal-install \
      imagemagick \
      librsvg2-bin \
      librsvg2-common \
      zlib1g \
      zlib1g-dev &&\
# fix the access rights for imagemagick
  echo "Fixing access rights for imagemagick." &&\
  sed -i -e 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml &&\
  sed -i -e 's/<\/policymap>/<policy domain="module" rights="read|write" pattern="{PS,PDF,XPS}" \/>\n<\/policymap>/g' /etc/ImageMagick-6/policy.xml &&\
# print the versions of cabal and ghc
    cabal --version &&\
    ghc --version &&\
# get the newest list of packages
    cabal update &&\
    cabal install pandoc &&\
    cabal install pandoc-citeproc

# Install pip3 and installation tools
RUN apt-get -y --no-install-recommends install \
    python3-pip  python3-dev

# Commonly used R packages
RUN Rscript -e  "install.packages( \
    c('bookdown', \
      'here', \
      'leanpubr', \
      'optparse', \
      'oro.nifti', \
      'qpdf', \
      'R.utils', \
      'rprojroot', \
      'rgoogleslides', \
      'servr', \
      'spelling', \
      'styler'))"

# Copy over git token
COPY git_token.txt .

# Install packages from github
RUN Rscript --vanilla install_github.R \
  --packages "jhudsl/didactr, jhudsl/leanbuild" \
  --token git_token.txt

# Set final workdir for commands
WORKDIR /home/rstudio
