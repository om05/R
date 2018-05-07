library("rvest")
library("gsubfn")
library("xlsx")

url <- 'https://top250.platts.com/Industry'
faslodex <- read_html(url1)
PRank_data_html <- html_nodes(faslodex, 'td:nth-child(1) span')
PRank <- html_text(PRank_data_html, trim = TRUE)
PRank <- as.numeric(PRank)

####Preprocessing
Ratings2 <- as.numeric(html_text(Rating2_data_html, trim = TRUE))
com_data <- gsub("Comment:","",com_data)
com_data <- gsub("\t","",com_data)
comment_data6 <- gsub("\"","",comment_data6)##TO rmv " symbol





Navelbine_data <- data.frame(
  "Platts Rank" = PRank, "Company Name" = Comapany, "Region" = Region, "Industry" = RTa
)
write.xlsx(Navelbine_data, "R_data.xlsx")

################regular expressions

gsub("^\\s+|\\s+$","",.) #to remove white spaces frm beginin & End


###############Info##########################
# html_nodes(): identifies HTML wrappers.
# html_nodes(".class"): calls node based on css class
# html_nodes("#id"): calls node based on <div> id
# html_nodes(xpath="xpath"): calls node based on xpath
# html_attrs(): identifies attributes (useful for debugging)
# html_table(): turns HTML tables into data frames
# html_text(): strips the HTML tags and extracts only the text








