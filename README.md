[![Build Status](https://travis-ci.org/ukgovdatascience/statspicker.svg?branch=master)](https://travis-ci.org/ukgovdatascience/statspicker)
[![GitHub tag](https://img.shields.io/github/tag/ukgovdatascience/statspicker.svg)](https://github.com/ukgovdatascience/statspicker/releases)

# statspicker

Quick cross-tabulation of categorical data for inclusion in Rmarkdown chunks.

## Installation

The package can then be installed using `devtools::install_github('ukgovdatascience/statspicker')`. 
Some users may not be able to use the `devtools::install_github()` commands as a result of network security settings. 
If this is the case, `statspicker` can be installed by downloading the [zip of the repository](https://github.com/ukgovdatascience/statspicker/archive/master.zip) and installing the package locally using `devtools::install_local(<path to zip file>)`.

## Usage

``` 
# Load vcd for Arthritis data
library(vcd)
library(statspicker)

# Instantiate class with:

cls <- statspicker(Arthritis)

# Pass a vector of levels to the pick class to cross-tabulate. Arguments must be
passed in a quoted vector or list. Order is unimportant.

pick(cls, c('Female','Treated','None'))

```
