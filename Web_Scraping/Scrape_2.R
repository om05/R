library("rvest")
library("gsubfn")
library("xlsx")

url <- 'https://scistarter.com/finder?phrase=&lat=&lng=&activity=At%20the%20beach&topic=&search_filters=&search_audience=&page=1#view-projects'

scistarter_html <- read_html(url)

scistarter_html %>%
  html_nodes("a") %>%
  head()



scistarter_html %>%
  html_nodes("div#project-listing") %>%
  head()


scistarter_html %>%
  html_nodes("table") %>%
  head()


################Code

scistarter_html %>%
  html_nodes("div#project-listing") %>%
  html_nodes("table") %>%
  html_table() %>%
  "["(1) %>% str()

scistarter_html %>%
  html_nodes("div#project-listing") %>%
  html_nodes("h3") %>%
  html_text() %>%
  gsub("^\\s+|\\s+$","",.)

scistarter_html %>%
  html_nodes("div#project-listing") %>%
  html_nodes("table") %>%
  html_text() %>%
  gsub("^\\s+|\\s+$","",.)

#######################To Get data for One particular page########################
scistarter <- scistarter_html %>%
  html_nodes("td") %>%
  html_text() %>%
  gsub("^\\s+|\\s+$","",.) #To remove whitespaces from begining n End

Goals <- scistarter[seq(from = 1, to = 30, by = 3)]
Tasks <- scistarter[seq(from = 2, to = 30, by = 3)]
Location <- scistarter[seq(from = 3, to = 30, by = 3)]

scistarter_data <- data.frame(
  "Goals" = Goals, "Tasks" = Tasks, "Location" = Location
)

##########Automation for all pages
pages <- ceiling(832/10) #No of pages
sci.df <- data.frame()

for( page in (1:pages))
{
  print(paste0("Gettin Data for page ", page))
  URL <- paste0("https://scistarter.com/finder?phrase=&lat=&lng=&activity=At%20the%20beach&topic=&search_filters=&search_audience=&ordering=quality&page=",page,"#view-projects")
  scistarter_html <- read_html(URL)
  scistarter <- scistarter_html %>%
    html_nodes("td") %>%
    html_text() %>%
    gsub("^\\s+|\\s+$","",.)
  
  goal <- (scistarter[seq(from = 1, to = 30, by = 3)])
  tasks <- scistarter[seq(from = 2, to = 30, by = 3)]
  loc <- scistarter[seq(from = 3, to = 30, by = 3)]

  
  title <- scistarter_html %>%
    html_nodes("div#project-listing") %>%
    html_nodes("h3") %>%
    html_text() %>%
    gsub("^\\s+|\\s+$","",.)
  
  
  goal <- goal[!is.na(goal)]
  tasks <- tasks[!is.na(tasks)]
  loc <- loc[!is.na(loc)]
  title <- title[!is.na(title)]
  
  
  tmp <- data.frame(title, goal, tasks, loc)
  
  if(pages == 1) {
    sci.df <- data.frame(tmp)
  } else {
    sci.df <- rbind(sci.df, tmp)
  }
  
}















