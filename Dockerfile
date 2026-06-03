ARG R_VERSION=4.6.0

FROM inseefrlab/onyxia-rstudio:r${R_VERSION}

RUN apt-get update && apt-get install -y cargo
RUN R -e "install.packages('pak', repos = c(CRAN = 'https://cloud.r-project.org'))"
COPY DESCRIPTION DESCRIPTION
ARG GITHUB_PAT
ENV GITHUB_PAT=${GITHUB_PAT}
RUN R -e "pak::local_install_deps(root = '.', upgrade = FALSE, ask = FALSE)"

