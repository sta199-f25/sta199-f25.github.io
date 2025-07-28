# sta199-f25.github.io

## Colors

-   `#5D737E` - Grayish blue

-   `#9AA067` - Pantone Fern (Fall 2024 / Winter 2024 colors)

-   `#FE5D26` - Pantone Red Orange

-   `#c57644` - Pantone Tomato Cream

-   `#BCF4F5` - Bright tealish blue

## Rendering

Locally, in RStudio, click *Build Website* on the Build tab or in any editor (including RStudio), run `quarto render` in the Terminal.

## Publishing

Push changes to the repo to trigger the GitHub Action that publishes the website. If any R packages are added or updated, run `renv::snapshot()`, commit, and push the updated lockfile.

## Things edited for axe devtools:

-   \_quarto.yml: replaced {{< fa heart >}}\]{style="color: `#FFBE98`;"}. with

    <p>This page is built with [♥]{style="color: #FFBE98;"} and <a href="https://quarto.org/">Quarto</a>.</p>

    -   I ran into issues with font awesome. Originally Chatgpt and Claude suggested I change it the html code from \<i class="fa-solid fa-heart" aria-label="heart"\>\</i\> to \<i class="fa-solid fa-heart" role="img" aria-label="heart"\>\</i\>; but then the heart didn't appear at all

-   index.qmd: replaced "*To be posted*" with "*To be posted*" (asterisks with underscores -- asterisks made font a faded color)

-   added language to sta199.scss file in order to add text to link images (e.g., github, laptop)

    -   /\* Added to ignore text within links \*/ .about-link-text { position: absolute; width: 1px; height: 1px; margin: -1px; padding: 0; overflow: hidden; clip: rect(0 0 0 0); white-space: nowrap; border: 0; }

-   also added text argument to link icons in course-overview.qmd file. (laptop, github)

## Things to come back to

-   \_quarto.yml: see commented lines

-   course-syllabus.qmd: ed discussion link, update grading percentages, revisit citing AI, lecture recording requests (two spots), syllabus bounty, check important dates (removed project milestone dates), revisit exams section

-   course-support.qmd: peer tutoring section (removed for now), ai chatbot (removed for now)

-   course-team.qmd: Teaching assistants section

-   course-links.qmd: ed discussion, gradescope, gradebook

-   course-overview.qmd: do we want logo file (it currently doesn't exist) — may just want to change this page to remove the first column

    ## 
