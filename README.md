# statspicker

Quick cross-tabulation of categorical data for inclusion in Rmarkdown chunks.

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
