## Little Shiny app with descriptive statistics of Iris dataset

# Installing Shiny on RStudio

``` r
install.packages("shiny")
library(shiny)
```

Shiny apps have two components:
- a user-interface script
- a server script

The user-interface (ui) script controls the layout and appearance of the app. It is defined in the source script named `
ui.R`.
The `server.R` script contains the instructions that your computer needs to build the app.

# Launch the app 

You can launch the app by running `runGitHub("Shiny-Iris", "belekkk")` on R Console or by [direct link](http://iris.axelbellec.fr/).
