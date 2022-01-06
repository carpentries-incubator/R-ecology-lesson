---
title: "Introduction to R and RStudio"
teaching: 10
exercises: 2
---

- open RStudio
- make an R project on the Desktop
- introduce RStudio layout
- concept of a script and console
- reproducibility
  - change a few settings

:::::::::::::::::::::::::::::::::::::: questions 

- How do you get started in R and RStudio?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the difference between R and RStudio
- Describe the purpose of the different RStudio panes
- Organize files and directories into R Projects
- Use the RStudio help interface to get help with R functions
- Be able to format questions to get help in the broader R community

::::::::::::::::::::::::::::::::::::::::::::::::

## What are R and RStudio?

`R` refers to a programming language as well as the software that interprets R code.

[RStudio](https://rstudio.com) is a software interface that can make it easier to write R scripts and interact with the R software. It's a very popular platform, and RStudio also maintains the [`tidyverse`](https://www.tidyverse.org/) series of packages we will use in this lesson.

## Why learn R?

### R does not involve lots of pointing and clicking, and that's a good thing

Since R is a programming language, the results of your analysis do not rely on remembering a succession of pointing and clicking, but instead on a series of written commands, and that's a good thing! So, if you want to redo your analysis because you collected more data, you don't have to remember which button you clicked in which order to obtain your results; you just have to run your script again.

Working with scripts makes the steps you used in your analysis clear, and the code you write can be inspected by someone else who can give you feedback and spot mistakes. 

Working with scripts forces you to have a deeper understanding of what you are doing, and facilitates your learning and comprehension of the methods you use. 

### R code is great for reproducibility

Reproducibility is when someone else (including your future self) can obtain the same results from the same dataset when using the same analysis. 

R integrates with other tools to generate manuscripts from your code. If you collect more data, or fix a mistake in your dataset, the figures and the statistical tests in your manuscript are updated automatically. 

An increasing number of journals and funding agencies expect analyses to be reproducible, so knowing R will give you an edge with these requirements.  

### R is interdisciplinary and extensible

With tens of thousands of packages that can be installed to extend its capabilities, R provides a framework that allows you to combine statistical approaches from many scientific disciplines to best suit the analytical framework you need to analyze your data. For instance, R has packages for image analysis, GIS, time series, population genetics, and a lot more.  

### R works on data of all shapes and sizes

The skills you learn with R scale easily with the size of your dataset. Whether your dataset has hundreds or millions of lines, it won't make much difference to you. 

R is designed for data analysis. It comes with special data structures and data types that make handling of missing data and statistical factors convenient. 

R can connect to spreadsheets, databases, and many other data formats, on your computer or on the web.  

### R produces high-quality graphics

R has well-developed plotting capabilities, and the `ggplot2` package is one of, if not the most powerful plotting language today. We will begin learning to use `ggplot2` in the next episode.

### R has a large and welcoming community

Thousands of people use R daily. Many of them are willing to help you through mailing lists and websites such as [Stack Overflow](https://stackoverflow.com/), or on the [RStudio community](https://community.rstudio.com/).

Since R is very popular among researchers, most of the help communities and learning materials are aimed towards other researchers. Python is a similar language to R, and can accomplish many of the same tasks, but is widely used by software developers and software engineers, so Python resources and communities are not as oriented towards researchers.
  
### Not only is R free, but it is also open-source and cross-platform

Anyone can inspect the source code to see how R works. Because of this transparency, there is less chance for mistakes, and if you (or someone else) find some, you can report and fix bugs.

## Navigating RStudio

We will use the RStudio integrated development environment (IDE) to write code into scripts, run code in R, navigate files on our computer, inspect objects we create in R, and look at the plots we make. RStudio has many other features that can help with things like version control, developing R packages, and writing Shiny apps, but we won't cover those in the workshop.

![*RStudio screenshot*](fig/rstudio_screenshot.png)

In the above screenshot, we can see 4 "panes" in the default layout:

- Top-Left: the **Source** pane that displays scripts and other files
- Top-Right: the **Environment/History** pane, which shows all the objects in your current R session (Environment) and your command history (History)
  - there are some other tabs here, including Connections, Build, Tutorial, and possibly Git
  - we won't cover any of the other tabs, but RStudio has lots of other useful features
- Bottom-Left: the **Console** pane, where you can interact directly with an R console, which interprets R commands and prints the results
  - There are also tabs for Terminal and Jobs
- Bottom-Right: the **Files/Plots/Help/Viewer** pane to navigate files or view plots and help pages

You can customize the layout of these panes, as well as many settings such as RStudio color scheme, font, and even keyboard shortcuts. You can access these settings by going to the menu bar, then clicking on Tools → Global Options.

RStudio puts most of the things you need to work in R into a single window, and also includes features like keyboard shortcuts, autocompletion of code, and syntax highlighting (different types of code are colored differently).

## Getting set up in RStudio

It is a good practice to get into the habit of organizing your projects into self-contained folders right from the start. A well-organized project is easier to navigate, more reproducible, and easier to share with others. Your project should contain a top-level folder that contains everything necessary for the project, including data, scripts, and images, all organized into sub-folders.

RStudio provides a "Projects" feature that can make it easier to work on individual projects in R. We will create a project that we will keep everything for this workshop.

1. Start RStudio (you should see a view similar to the screenshot above).
2. In the top right, you will see a blue 3D cube and the words "Project: (None)". Click on this icon.
3. Click **New Project** from the dropdown menu.
4. Click **New Directory**, then **New Project**.
5. Type out a name for the project, we recommend `R-Ecology-Workshop`.
6. Put it in a convenient location using the "Create project as a subdirectory of:" section. We recommend your `Desktop`. You can always move the project somewhere else later, because it will be self-contained.
7. Click **Create Project** and your new project will open.

Next time you open RStudio, you can click that 3D cube icon, and you will see options to open existing projects, like the one you just made.

One of the benefits to using RStudio Projects is that they automatically set the **working directory** to the top-level folder for the project. The working directory is the folder where R is working, so it views the location of all files (including data and scripts) as being relative to the working directory. You may come across scripts that include something like `setwd("/Users/YourUserName/MyCoolProject")`, which directly sets a working directory. This is usually much less portable, since that specific directory might not be found on someone else's computer. Using RStudio Projects means we don't have to deal with manually setting the working directory.

There are a few settings we will need to adjust to improve the reproducibility of our work. Go to your menu bar, then click Tools → Global Options to open up the Options window.

![*RStudio Global Options*](fig/rstudio_settings.png)

Make sure your settings match those highlighted in yellow. We don't want RStudio to store the current status of our R session and reload it the next time we start R. This might sound convenient, but for the sake of reproducibility, we want to start with a clean, empty R session every time we work. That means that we have to record everything we do into scripts, save any data we need into files, and store outputs like images as files. We want to get used to everything we generate in a single R session being *disposable*. We want our scripts to be able to regenerate anything we need, any time we need it.

## Organizing your project directory

Using a consistent folder structure across all your projects will help keep a growing project organized, and make it easy to find files in the future. This is especially beneficial if you are working on multiple projects.

We will use a basic structure for this workshop, which is often a good place to start. Here is a diagram describing the structure:

```
R-Ecology-Workshop
│
└── scripts
│
└── data
│    └── cleaned
│    └── raw
│
└─── images
│
└─── documents
```

Within our project folder (`R-Ecology-Workshop`), we first have a `scripts` folder to hold any scripts we write. We also have a `data` folder containing `cleaned` and `raw` subfolders. In general, you want to keep your `raw` data completely raw, so once you put data into that folder, you do not modify it. Instead, you read it into R, and if you make any modifications, you write that modified file into the `cleaned` folder. We also have an `images` folder for images, and a `documents` folder for any other documents you might produce.
