
<!-- README.md is generated from README.Rmd. Please edit that file -->

# KIRAN

<!-- badges: start -->
<!-- badges: end -->

## Purpose

This R package automates installation for some of the R packages needed
for the functioning of R based data processing and visualization tools
developed for the International Model for Policy Analysis of
Agricultural Commodities and Trade (IMPACT) model.

The IMPACT model was developed in the early 1990s to explore the long
term challenges facing policymakers in reducing hunger and poverty in a
sustainable fashion. The IMPACT model has been expanded and improved
repeatedly to respond to increasingly complex policy questions and the
state-of-the-art of modeling. [See documentation of most recent
update](http://www.ifpri.org/publication/international-model-policy-analysis-agricultural-commodities-and-trade-impact-model-0).

## Background

Using the package described here, we will establish the KIRAN suite of R
based packages. KIRAN stands for *Key IMPACT R-Archive Network* akin to
Comprehensive R Archive Network (CRAN) which acts as a default
repository for many of the R packages.

The goal of this is to to be able to automate the installation process
for the three major libraries which make up the KIRAN suite of packages
developed by the Foresight and Policy Modeling unit of IFPRI.

## Prerequisites:

1.  [Base R installation](https://cloud.r-project.org/). Please use
    v4.2.3 or greater (whichever is the latest stable release in case
    you are installing it for the first time)

2.  [R studio installation available from
    Posit](https://posit.co/download/rstudio-desktop/)

3.  [Rtools installation (on Windows. Not needed on
    Mac/Linux)](https://cran.r-project.org/bin/windows/Rtools/) - please
    check for the correct Rtools version based on your base R
    installation from either step 1 or your existing R installation

4.  If you prefer a command prompt interface – please add R executable
    to your environment variables on Windows based machines.

## Installing `KIRAN` package

The `KIRAN` package can be easily installed from IFPRI’s R-Universe. To
do so, open a new session of R or R-Studio from your R/R-Studio
installations, and paste the following command on the “Console” of your
R/R-Studio session and press enter.

``` r
# Installing from r-universe of IFPRI
install.packages('KIRAN', 
                 repos='http://https://ifpri.r-universe.dev/',
                 dependencies = TRUE)
```

Please play close attention to your screen, R/R-Studio might generate
some pop-up windows which might not automatically appear on top of yor
screen.

Check the task bar on windows machines for any app symbol which might be
“blinking”. The same might apply to linux based machines.

Usually, R can do the following once you execute the above command in
the form of pop-ups:

- Ask you to choose a default CRAN repository. Choose 0, or location
  closest to you.

- Ask you to restart your R session. Choose Yes if prompted

## In case of no “errors” during `KIRAN` installation

In case no substantial errors were encountered during the previous step,
we can proceed further.

Go back to your R/R-Studio session and type the following and press
enter

``` r
library(KIRAN)
install_KIRAN()
```

The command above attempts to install all the packages needed for the
correct functioning of the R-based libraries which make up the KIRAN
suite of packages.

The workflow of the above command is as follows:

1.  Installs core R packages which are needed to facilitate the data
    transfer between GAMS and R
2.  Installation of `devtools`
3.  Installation of `magclass` for array based operations
4.  Detection of `GAMS` installation
5.  Automatic installation of `gamstransfer` package
6.  Setting up the KIRAN suite of packages (`DOORMAT`, `reportIMPACT`,
    `ARIA`)

Once again, please play close attention to your screen, R/R-Studio might
generate some pop-up windows which might not automatically appear on top
of your screen.

There might even be errors or warnings shown on your R/R-Studio console.
Usually these errors or warnings are self-explanatory. In case you are
not successful in fixing these errors/warnings, see last section of this
document.

## Questions / problems

In case of questions / problems please contact Abhijeet Mishra
(<A.Mishra@cgiar.org>)
