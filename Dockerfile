# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest 

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# install renv & restore packages
RUN R -e "install.packages('shinythemes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('forecast', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('xts',dependencies=TRUE, repos='http://cran.rstudio.com/')"
