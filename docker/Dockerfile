FROM rocker/tidyverse:4.0.2
LABEL maintainer="cansav09@gmail.com"
WORKDIR /rocker-build/

COPY install_github.R .

# Install apt-getable packages to start
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils dialog

# These packages are dependencies
RUN apt-get install -y --no-install-recommends \
    libxt6 \
    libpoppler-cpp-dev

# Add curl, bzip2
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    bzip2 \
    curl

# Install pip3 and installation tools
RUN apt-get -y --no-install-recommends install \
    python3-pip  python3-dev

## R packages

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
