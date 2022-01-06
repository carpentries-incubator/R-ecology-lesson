# Plans for tidyverse update

This update to the *R for Ecology* lesson is a significant shift in both the structure and content of the lesson. First, it updates the lesson to focus primarily on `tidyverse` tools rather than base R approaches. As the `tidyverse` has matured and grown in recent years, we believe it is in line with the Carpentries principle of "teach the most useful things first" to focus on the most useful and intuitive set of tools available. We continue to teach certain base R approaches and point learners towards the Software Carpentry R lessons as resources for learning base R approaches.

Second, the lesson now starts with visualization with `ggplot2`. We have chosen to start with `ggplot` for several reasons. First of all, it gets learners creating usable plots from actual data very quickly, demonstrating the immediate usefulness of learning R. Second, since `ggplot2` has a relatively self-contained syntax, there is relatively little sidetracking to introduce broader terms and jargon. We do introduce certain concepts, such as functions, objects, and assignment, but they are not covered in overwhelming detail at this point.

Finally, the lesson is given a more narrative structure, following up ggplot with a discussion of what exactly this `surveys` dataframe is. It then uses dataframes as a motivation for learning about vectors and data types, rather than starting with basic vectors that are only connected to "real data" later on. Up until this point, we use a subset of the entire `portal` dataset, containing only years X through Y, in a complete and tidy format. This allows us to then introduce "new" data from years Y through Z, which are incomplete and not in a tidy format. Receiving new data to clean is a very real challenge, and the process of reshaping it to match the older, cleaner data provides several benefits: a) it teaches skills like cleaning data, handling missing data, and combining multiple datasets and b) provides scaffolding by using the older data as a target. We believe this narrative structure will increase learner engagement and decrease the "don't worry, this will be useful later on" statements that instructors may find themselves giving.

## Key topics

**should crosslist these with SWC R lessons**

- creating objects
- commenting code
- tab complete
- keyboard shortcuts
- functions and arguments
- vectors
- data types
- subsetting vectors
- conditional subsetting
- missing data
- reading in data
- dataframes
- functions to inspect dataframes
- subsetting dataframes
- factors
- dates
- pipes
- select
- filter
- mutate
- group_by
- summarize
- pivot
- exporting data

## Dataset

Using the `ratdat` package. Currently, we are working with the `complete` dataframe, but I think I prefer moving towards a slightly different split:

#### Old, complete data

We start learners off with about half of the `complete` dataframe, using only older data. This includes the `plots`, `species`, and `survey` data, and does include `NA`s. We could think about not introducing missing data yet, but I think it might get put off too much.

#### New, messy data

After doing basics of working with data, we show them how to import data. We will import a CSV file with the surveys data and species data combined. This file will be messy, with a couple of issues. First, the data won't be in a tidy form. Second, we will throw in a few duplicate rows, and maybe a typo or two.

While working with the new data, we demonstrate the basics of `dplyr` and `tidyr`, the idea of data vaidation and exploration (maybe even some exploratory viz?). Then we say "hey, we've also got all this plot data" and introduce joins. Then when we are done with this part, we use `bind_rows()` to add the new data to the old, and do some data export.

## Narrative Structure

- visualization with ggplot
    - use ~50% of years in whole surveys dataframe, nice and clean
    - introduce a bit of jargon along the way
- exploring data in R
    - ok so what was that surveys thing we just used?
    - what about these functions we're using? can we learn a bit more about them?
    - what are these things we get when we use `$` subsetting?
    - how do we work directly with vectors?
    - how do we name and work with objects?
        - should still do something like x <- 10; y <- x; x <- 5; y
- manipulating data in R
    - we've been working with nice clean data from years past, but now we've been given more of the surveys data from recent years, and it's messy
    - how do we import our data?
    - how do we handle missing data?
    - how do we deal with dates?
    - how do we subset our data?
    - how do we create new columns?
    - how do we calculate summaries across groups?
    - how do we pivot the data into the right format?
        - I think we go from wide to long
        - could also go long to wide to do something like differences between years. So like filter out first and last year, group by species and year, pivot wider so one column per year, then mutate to get differences
- how do we combine multiple datasets?
    - joins for adding `plot_type` stuff to newer data, `bind_rows()` for new and old data
    - what happens if some of the data are in a database?


## Pedantic Collaborator

You're working on a project when your advisor tells you that you should work with one of their long-time collaborators to help you get your work done. According to your advisor, this collaborator is very talented, but only speaks a language that you don't know. Your advisor assures you that this is ok, the collaborator won't judge you at all and will happily answer your questions. However, they also tell you to be aware that the collaborator is also quite pedantic. While they don't mind that you don't speak their language, they are always going to answer you quite literally.

You decide to reach out to the collaborator. You find that they email you back very quickly, almost immediately most of the time. Since you're just learning their language, you often make mistakes. Sometimes, they tell you that you've made a grammatical error or warn you that what you asked for doesn't make a lot of sense. Sometimes these warnings are difficult to understand, because you don't really have a grasp of the underlying grammar. Sometimes you get an answer back, with no warnings, but you realize that it doesn't make sense, because what you asked for isn't quite what you *wanted*. Since this collaborator responds almost immediately, without tiring, you can quickly reformulate your question and send it again.

In this way, you begin to learn the language your collaborator speaks, as well as the particular way they think about your work. Eventually, two of you develop a good working relationship, where you understand how to ask them questions effectively, and how to work through any issues in communication that might arise.

This collaborator's name is `R`.

When you send commands to `R`, you get a response back. Sometimes, when you make mistakes, you will get back a nice, informative error message or warning. However, sometimes the warnings seem to reference a much "deeper" level of R than you're familiar with. Or, even worse, you may get the wrong answer with no warning because the command you sent is perfectly valid, but isn't what you actually want. While you may first have some success working with R by memorizing certain commands or reusing other scripts, this is akin to using a collection of tourist phrases or pre-written statements when having a conversation. You might make a mistake (like getting directions to the library when you need a bathroom), and you are going to be limited in your flexibility (like furiously paging through a tourist guide looking for the term for "thrift store").

This is all to say that we are going to spend a bit of time digging into some of the more fundamental aspects of the R language, and these concepts may not feel as immediately useful as, say, learning to make plots with `ggplot2`. However, learning these more fundamental concepts will help you develop an understanding of how R thinks about data and code, how to interpret error messages, and how to flexibly expand your skills to new situations.

## Lessons

### Visualization With `ggplot2`

This lesson sticks almost entirely to `ggplot2`, but there are a few things that are relevant to later lessons:

- `str()` is introduced
- `<-` is briefly introduced, though it should be explained fully again, with a "as we saw before"
- we use a `data.frame` but don't really introduce that
- we will still need to make more plots later, since some plots require data summary. This is good though, it will refresh some of the `ggplot` stuff and demonstrate how plotting is an important part of the workflow

### How R Thinks About Data

Some random thoughts on where to go after `ggplot`:

- we could introduce `data.frame`s next
    - pros:
        - steps directly from using them in `ggplot`
        - keeps their interest on actual data
        - might make it less frustrating to then step back and talk about vectors
    - cons:
        - might turn out that you do a lot of "oh we'll get to this later when we talk about vectors"


#### Possible Outline

- dataframes
    - already working with them
    - we're using one that's loaded from an `R` package
        - explain what a package is
        - packages mostly functions
        - what's a function, you ask?
- functions
    - already working with them
- assignment, objects, naming
- vectors
    - show `$` subsetting
    - types
    - `c()`
    - factors


### Manipulating Data

Here's where we should introduce the `base` vs. `tidyverse` split. Point towards other Carpentries lessons as ways to learn base R, emphasize that they WILL encounter base R stuff, and maybe briefly mention square bracket subsetting as an important feature they should learn at some point. Then jump to `dplyr` and `tidyr` stuff.


