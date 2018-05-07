library("rvest")
library("gsubfn")
library("xlsx")


url1 <- 'https://top250.platts.com/Industry'

faslodex <- read_html(url1)

PRank_data_html <- html_nodes(faslodex, 'td:nth-child(1) span')
PRank <- html_text(PRank_data_html, trim = TRUE)
PRank <- as.numeric(PRank)


Company_data_html <- html_nodes(faslodex, '.inner a')
Comapany <- html_text(Company_data_html, trim = TRUE)



Region_data_html <- html_nodes(faslodex, '.regionTab')
Region <- html_text(Region_data_html, trim = TRUE)


RTa_data_html <- html_nodes(faslodex, '.regionTab+ td span')
RTa <- html_text(RTa_data_html, trim = TRUE)


Navelbine_data <- data.frame(
  "Platts Rank" = PRank, "Company Name" = Comapany, "Region" = Region, "Industry" = RTa
)
write.xlsx(Navelbine_data, "R_data.xlsx")


