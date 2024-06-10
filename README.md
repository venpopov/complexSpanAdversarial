# complexSpanAdversarial

<!-- badges: start -->
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Project information

Repository for the project "An adversarial collaboration contrasting two explanations for the effect of working memory load on distractor processing during encoding and retention"

Preregistration: https://osf.io/d2zby

Collaborators:

- David Greeno
- Vencislav Popov
- Candice C. Morey

## How to download and reproduce the analyses

You can [download the repository as a zip file](https://github.com/venpopov/complexSpanAdversarial/archive/refs/heads/main.zip) and extract it on your computer, or you can clone the repository using git by running the following command in your terminal:

```bash
git clone https://github.com/venpopov/complexSpanAdversarial.git
```

To reproduce the analyses in this project, you will need to have R and maybe RStudio installed on your computer. You can download R from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/), and RStudio from the [RStudio website](https://www.rstudio.com/products/rstudio/download/). If you are not using RStudio, you need to install [Quarto](https://quarto.org/docs/get-started/) to render the quarto reports (this website).

The project is structured so that you can replicate it on any machine without having to worry about R package versions, file paths, etc. Once you have R and RStudio installed, you can open the `complexSpanAdversarial.Rproj` file in RStudio, which will set the working directory to the base directory of the project. We use the `renv` package to record the specific R packages and their versions necessary for this project. When you open the project in RStudio, the `renv` will first install itself (if it is not already installed). If for some reason the `renv` package is not installed, you can install it by running `install.packages("renv")` in the R console.

After the `renv` package is installed, you can install all the packages used in the project by running `renv::restore()`. This will install all the packages listed in the `renv.lock` file in a separate library specific to this project.

We use the [`targets`](https://docs.ropensci.org/targets/) package to manage the workflow of the project. You can run the entire workflow by running `targets::tar_make()`. This will generate all computational outputs in the projectm which can then be used to generate the reports or do further analyses.

## Folder structure

The project is organized in the following main folders:

- **data-raw:** raw data files
- **output:** *.rds* files containing computational outputs
- **docs:** source files for the quarto reports
- **R:** custom R functions (no interactive code)

## Website navigation

You can find the rendered reports on the [project website](venpopov.github.io/complexSpanAdversarial/). The website is organized in the following sections:

- **Development notes:** an unorganized collection of notebooks. These are mostly for my own reference during model development.
- **Notebooks:** a collection of notebooks that are more organized and presentable. These are intended to be shared with others.
- **Reports:** a collection of reports that summarize the development of the model and the results of the model.
- **Function reference:** documentation of custom functions used in the project.