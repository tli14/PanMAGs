library(ggpmisc)

## Fit the results with exponential model for each species.
## Read summary of core genome size for incompleteness datasets.
incomp_data <- read.table(file = "R_code/Fig3.frag_incomp/incomp_CG100_core.txt",  sep = '\t', header = TRUE)

## Create new file for equation (exponential model)
equation_line <- paste(c("Species", "a", "b", "Rsquared", "pvalue"), collapse = "\t")
write(equation_line, file = "R_code/Fig3.frag_incomp/incomp_equation.txt", append=TRUE, sep = "\t")

## Create new file for model data.
model_line <- paste(c("Species", "xvalues","yvalues"), collapse = "\t")
write(model_line, file = "R_code/Fig3.frag_incomp/incomp_model.txt", append=TRUE, sep = "\t")

## Build exponential model for each species, save model data, and write statistical results and equations to tab-delimited file.
for ( i in unique(incomp_data$Species)){ 
  subdata = subset(incomp_data, Species == i) 
  y <- subdata$genes
  x <- subdata$incomp
  exponential.model <- lm(log(y)~ x)
  summary(exponential.model)
  a <- round(summary(exponential.model)$coefficients[2], digits = 6)
  b <- format(round(summary(exponential.model)$coefficients[1], digits = 3), nsmall = 3)
  Rsquared <- format(round(summary(exponential.model)$adj.r.squared, digits = 4), nsmall = 3)
  pvalue <- signif(summary(exponential.model)$coefficients[2,4], digits = 4)
  new_equation_line <- paste(c(i, a, b, Rsquared, pvalue), collapse = "\t")
  write.table(new_equation_line, file = "R_code/Fig3.frag_incomp/incomp_equation.txt", append=TRUE, sep = "\t", row.names = FALSE, col.names = FALSE, quote=FALSE)
  xvalues <- seq(0, 5, 0.1)
  yvalues <- exp(predict(exponential.model,list(x=xvalues)))
  mod_data <- data.frame(xvalues,yvalues)
  Species <- rep(i, 51)
  new_model_line <- data.frame(Species,xvalues,yvalues)
  write.table(new_model_line, file = "R_code/Fig3.frag_incomp/incomp_model.txt", append=TRUE, sep = "\t", row.names = FALSE, col.names = FALSE, quote=FALSE)
}

