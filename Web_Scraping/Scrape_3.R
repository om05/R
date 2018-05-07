library("rvest")
library("gsubfn")
library("xlsx")

url1 <- 'https://top250.platts.com/Industry'
industry_data <- data.frame()

industry_html <- read_html(url1)

ind <- industry_html %>%
  html_nodes("div.leftcolumn") %>%
  html_nodes("td") %>%
  html_text() %>%
  gsub("^\\s+|\\s+$","",.)

ind <- ind[c(-1)]

prank <- as.numeric(ind[seq(from = 1, to = length(ind), by = 4)])
cname <- ind[seq(from = 2, to = length(ind), by = 4)]
region <- ind[seq(from = 3, to = length(ind), by = 4)]
industry <- ind[seq(from = 4, to = length(ind), by = 4)]

industry_data <- data.frame(
  "Platts Rank" = prank, "Company Name" = cname, "Region" = region, "Industry" = industry
)
