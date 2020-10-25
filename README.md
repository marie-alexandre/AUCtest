
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AUCtest

<!-- badges: start -->

<!-- [![Travis build status](https://travis-ci.com/marie-alexandre/AUCtest.svg?branch=master)](https://travis-ci.com/marie-alexandre/AUCtest) -->

<!-- badges: end -->

The goal of AUCtest is to propose a statistical test evaluating the
difference of Area under the curve (AUC) of a given outcome between two
distinct groups of individuals. To this end, longitudinal data obtained
for subjects splitted into G distinct groups are fitted with a
Mixed-Effects model whose fixed-effects (marginal dynamics) and
random-effects (individual dynamics) are respectively modeled by
group-structured polynomial or B-splines curves and individual
polynomial or B-spline curves.

## Installation

You can install the development version of AUCtest from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("marie-alexandre/AUCtest")
```
