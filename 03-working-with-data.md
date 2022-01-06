---
title: "Working with data"
teaching: 10
exercises: 2
---

- importing complete_old CSV
    - touch on column parsing
    - talk about file paths and tab completion
    - should we teach the `here()` package?
- base vs. tidyverse
- pipes
- select
- filter
    - idea of conditional subsetting
    - ==, >, !, |, &
    - show %in%
- mutate
- making a date column
- group_by
- pivot_wider
- exporting data




```r
library(tidyverse)
```

## Importing data

Thing

### File paths

Now, let's read our CSV file into R and store it in an object named `surveys`.


```r
surveys <- read_csv("data/cleaned/surveys_complete_77_89.csv")
```

```{.output}
Rows: 16878 Columns: 13
```

```{.output}
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (6): species_id, sex, genus, species, taxa, plot_type
dbl (7): record_id, month, day, year, plot_id, hindfoot_length, weight
```

```{.output}

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

You may have noticed a bit of feedback from R. We got some useful information about the CSV file we read in. We got:

- the number of rows and columns
- the **delimiter** of the file, which is how values are separated, a comma `","`
- a set of columns that were **parsed** as various vector types
  - the file has 6 character columns and 7 numeric columns
  - we can see the names of the columns for each type
  
 
When working with the output of a new function, it's often a good idea to check the `class()`:


```r
class(surveys)
```

```{.output}
[1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame" 
```

Whoa! What is this thing? It has multiple classes? Well, it's called a `tibble`, and it is the `tidyverse` version of a data.frame. It *is* a data.frame, but with some added perks. It prints out a little more nicely, it highlights `NA` values and negative values in red,


:::::::::::::::::::::::::::::::::::::::::: callout

**`tidyverse` vs. base R**

As we begin to delve more deeply into the `tidyverse`, we should briefly pause to mention some of the reasons for focusing on the `tidyverse` set of tools. In R, there are often many ways to get a job done, and there are other approaches that can accomplish tasks similar to the `tidyverse`.

The phrase **base R** is used to refer to approaches that utilize functions contained in R's default packages. We have already used some base R functions, such as `str()`, `head()`, and `mean()`, and we will be using more scattered throughout this lesson. However, there are some key base R approaches we will not be teaching. These include square bracket subsetting and base plotting. You may come across code written by other people that looks like `surveys[1:10, 2]` or `plot(surveys$weight, surveys$hindfoot_length)`, which are base R commands. If you're interested in learning more about these approaches, you can check out other Carpentries lessons like the [Software Carpentry Programming with R](https://swcarpentry.github.io/r-novice-inflammation/) lesson.

We choose to teach the `tidyverse` set of packages because they share a similar syntax and philosophy, making them consistent and producing highly readable code. They are also very flexible and powerful, with a growing number of packages designed according to similar principles and to work well with the rest of the packages. The `tidyverse` packages tend to have very clear documentation and wide array of learning materials that tend to be written with novice users in mind. Finally, the `tidyverse` has only continued to grow, and has strong support from RStudio, which implies that these approaches will be relevant into the future.

::::::::::::::::::::::::::::::::::::::::::

