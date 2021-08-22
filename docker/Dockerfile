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


### Install conda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
ENV PATH="/usr/lib/rstudio-server/bin:${PATH}"
ARG PATH="/usr/lib/rstudio-server/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda --version

# Remove old symlinks to old pandoc
RUN unlink /usr/lib/rstudio-server/bin/pandoc/pandoc

# Install pandoc and pandoc-citeproc
RUN conda install -c conda-forge pandoc

# Create new symlinks
RUN ln -s /root/miniconda3/bin/pandoc /usr/lib/rstudio-server/bin/pandoc/pandoc

# Add curl, bzip2
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    bzip2 \
    curl

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
