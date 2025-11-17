# sta199-f25.github.io

## Colors
 
Pantone Fall 2025 colors:

-   `#005871` - Lyons blue

-   `#d1805f` - Brandied melon

-   `#BE394F` - Winterberry

-   `#6b4140` - Hot chocolate

-   `#eed4d9` - Primrose pink

## Rendering

Locally, in RStudio, click *Build Website* on the Build tab or in any editor (including RStudio), run `quarto render` in the Terminal.

## Publishing

Push changes to the repo to trigger the GitHub Action that publishes the website. If any R packages are added or updated, run `renv::snapshot()`, commit, and push the updated lockfile.

## Things to come back to

-   \_quarto.yml: see commented lines (just project milestones left)

-   course-syllabus.qmd: revisit: teams, revisit: exams (language of exams vs final), revisit: teams, revisit: online resources (include example citation), AI tools for code (include example citation), revisit: "Any violations in academic honesty" and more clearly outline repercussions

-   course-support.qmd: peer tutoring section (removed for now, check again), ai chatbot (removed for now; maybe link DukeGPT?)

-   course-team.qmd: Teaching assistants section (update pics)

-   computing-troubleshooting:

    -   from this: If your issue persists, post on the course forum with details on what you’ve tried and the errors you see (including verbatim errors and/or screenshots).

    -   to this: If your issue persists, post on the course forum with your code (or up-to-date GitHub link), your container URL, what you’ve tried and the errors you see (including verbatim errors and/or screenshots).

        -   also add images: img/request-restart-\*

-   exam-review: is empty. probably should be

-   Project: removed all details about project for now; need to add another milestone, may want to edit some final milestone grading?

## Things edited for axe devtools:

-   \_quarto.yml: (UNDID THIS) replaced {{< fa heart >}}\]{style="color: `#FFBE98`;"}. with

    <p>This page is built with [♥]{style="color: #FFBE98;"} and <a href="https://quarto.org/">Quarto</a>.</p>

    -   I ran into issues with font awesome. Originally Chatgpt and Claude suggested I change it the html code from \<i class="fa-solid fa-heart" aria-label="heart"\>\</i\> to \<i class="fa-solid fa-heart" role="img" aria-label="heart"\>\</i\>; but then the heart didn't appear at all

-   index.qmd: replaced "*To be posted*" with "*To be posted*" (asterisks with underscores -- asterisks made font a faded color)

-   added language to sta199.scss file in order to:

    -   add text to link images (e.g., github, laptop)

        -   /\* Added to ignore text within links \*/ .about-link-text { position: absolute; width: 1px; height: 1px; margin: -1px; padding: 0; overflow: hidden; clip: rect(0 0 0 0); white-space: nowrap; border: 0; }

    -   make footnote back error darker

-   also added text argument to link icons in course-overview.qmd file. (laptop, github) – in addition to editing sta199.scss file

-   added/edited title to iframes (syllabus, FAQ, and code alongs)

Remaining issues:

-   code alongs: issues that seem to be generated in generation from .qmd to .html (images and stuff created by warpwire)

-   \_quarto.yml: heart (how to deal with it?)

-   syllabus: check marks and circle with line (how to deal with it?)

-   coding principles: one million issues

    -   contrast in colors

    -   can't have expanding box (that's hidden til it's clicked)

    -   plots need a role, e.g., role="img"

    -   table results need to be scrollable

    -   links (within the code functions need to be distinguishable without relying on color

-   will need to check project pages: one contrast issue, table cells (milestone 4), more contrast issues with code in tips+resources
