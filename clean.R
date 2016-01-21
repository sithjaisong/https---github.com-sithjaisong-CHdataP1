library(dplyr)
library(tidyr)

head(FORM1)
library(stringr)
str_split_fixed(FORM1$filename, "-", 6)


new <- FORM1 %>%
  separate(filename, c("SKEP", "SURVEY", "Country", "Year", "Season", "Fieldno"), "-") %>%
  transform(Fieldno = gsub(pattern = "\\.xls$", replacement = "", .$Fieldno))

head(new)
