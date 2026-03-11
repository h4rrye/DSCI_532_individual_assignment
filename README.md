# World Education Dashboard - Shiny for R

A simplified version of the World Education Dashboard, re-implemented in Shiny for R as part of DSCI 532 Individual Assignment.

## Description

This app visualizes global education data with interactive filtering by region. Users can:

- Select multiple regions using checkboxes
- View birth rate distributions by region in an interactive box plot
- Explore filtered country data in a sortable table

## Installation

Install required R packages:

```r
install.packages(c("shiny", "dplyr", "plotly", "DT", "bslib"))
```

## Running Locally

**Option 1:** In RStudio, open `app.R` and click "Run App"

**Option 2:** From R console:

```r
shiny::runApp("path/to/individual_assignment_r")
```

## Deployed App

🔗 [View Live App](https://h4rrye.shinyapps.io/individual_assignment_r/)

## Data

Uses processed global education data (202 countries, 41 indicators) from the DSCI 532 group project.

## Technical Details

- **Framework:** Shiny for R
- **Key Features:** 
  - 1 input component (checkbox group)
  - 1 reactive calculation (filtered data)
  - 2 output components (plotly chart + data table)
- **Theme:** Dark mode (Darkly Bootstrap theme)

