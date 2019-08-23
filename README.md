# easyGGIR
A few helpful functions for working with GGIR (actigraphy) output. More may be added as necessary.

### Installing easyGGIR

To install a package from github, first make sure the `devtools` package is installed and loaded. 

```{r}
library(devtools)
```
Then you can use the `install_github` function to install the package.

```{r}
install_github("amyr-hodgson/easyGGIR", build_vignettes = TRUE)
```
To see the vignette:

```{r}
browseVignettes("easyGGIR")
```
Please check that your data look as expected after using these functions, as they have not been tested by anyone other than myself.
