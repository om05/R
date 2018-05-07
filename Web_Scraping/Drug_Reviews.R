#############Drugs_Reviews################
library("rvest")
library("gsubfn")
library("xlsx")

url1 <- 'https://www.drugs.com/comments/fulvestrant/faslodex.html'

faslodex <- read_html(url1)

Patient1_data_html <- html_nodes(faslodex, '.user-type')

Patient1 <- html_text(Patient1_data_html, trim = TRUE)
Patient1 <- gsub(" .*","",Patient1)

comment1_data_html <- html_nodes(faslodex, 'b+ span')
comment_data <- html_text(comment1_data_html)

Rating1_data_html <- html_nodes(faslodex, '.user-comment .rating-score')
Ratings <- as.numeric(html_text(Rating1_data_html, trim = TRUE))

##############################faslodex 2################################
url1.1 <- 'https://www.webmd.com/drugs/drugreview-63185-Faslodex+intramuscular.aspx?drugid=63185&drugname=Faslodex+intramuscular'

faslodex1 <- read_html(url1.1)


Patient1.1_data_html <- html_nodes(faslodex1, '.reviewerInfo')
Patient1.1 <- html_text(Patient1.1_data_html)


com_data_html <- html_nodes(faslodex1, '#comTrunc4 , #comTrunc5 , #comTrunc1 , #comTrunc3')
com_data <- html_text(com_data_html)
com_data <- gsub("Comment:","",com_data)
com_data <- gsub("\t","",com_data)
com_data <- append(com_data," ")

ratings_2 <- c(4,5,3,2,5)

patient <- as.factor(c(Patient1,Patient1.1))
comments <- c(comment_data, com_data )
Ratings <- c(Ratings,ratings_2)


Patient_data <- data.frame(
  Patient = patient, Comment = comments, Rating = Ratings
)


###########################Xeloda############################################

url2 <- 'https://www.drugs.com/comments/capecitabine/xeloda.html'

Xeloda <- read_html(url2)

Patient2_data_html <- html_nodes(Xeloda, '.user-type')

Patient2 <- html_text(Patient2_data_html, trim = TRUE)
Patient2 <- gsub(" .*","",Patient2)

comment2_data_html <- html_nodes(Xeloda, 'b+ span')
comment_data2 <- html_text(comment2_data_html)

Rating2_data_html <- html_nodes(Xeloda, '.user-comment .rating-score')
Ratings2 <- as.numeric(html_text(Rating2_data_html, trim = TRUE))
Ratings2 <- as.numeric(append(Ratings2," "))

Xeloda_data <- data.frame(
  Patient = Patient2, Comment = comment_data2, Rating = Ratings2
)




write.xlsx(Patient_data, "faslodex_data.xlsx")
write.xlsx(Xeloda_data, "Xeloda_data.xlsx")


  ####################################Ibrance#####################################
url3 <- 'https://www.drugs.com/comments/palbociclib/ibrance.html'

Ibrance <- read_html(url3)

Patient3_data_html <- html_nodes(Ibrance, '.user-type')

Patient3 <- html_text(Patient3_data_html, trim = TRUE)
Patient3 <- gsub(" .*","",Patient3)
Patient3 <- gsub("15","Joe",Patient3)

comment3_data_html <- html_nodes(Ibrance, 'b+ span')
comment_data3 <- html_text(comment3_data_html)

Rating3_data_html <- html_nodes(Ibrance, '.rating-score')
Ratings3 <- as.numeric(html_text(Rating3_data_html, trim = TRUE))
Ratings3 <- as.numeric(append(Ratings3,10))

Ibrance_data <- data.frame(
  Patient = Patient3, Comment = comment_data3, Rating = Ratings3
)
write.xlsx(Ibrance_data, "Ibrance_data.xlsx")



###################################Letrozole####################
url4 <- 'https://www.drugs.com/comments/letrozole/'

Letrozole <- read_html(url4)

Patient4_data_html <- html_nodes(Letrozole, '.user-type')

Patient4 <- html_text(Patient4_data_html, trim = TRUE)
Patient4 <- gsub(" .*","",Patient4)

comment4_data_html <- html_nodes(Letrozole, 'b+ span')
comment_data4 <- html_text(comment4_data_html)

Rating4_data_html <- html_nodes(Letrozole, 'tr+ tr .rating-score , .user-comment .rating-score')
Ratings4 <- as.numeric(html_text(Rating4_data_html, trim = TRUE))

Letrozole_data <- data.frame(
  Patient = Patient4, Comment = comment_data4, Rating = Ratings4
)
write.xlsx(Letrozole_data, "Letrozole_data.xlsx")

#####################################Docetaxel#############
url5 <- 'https://www.drugs.com/comments/docetaxel/'

Docetaxel <- read_html(url5)

Patient5_data_html <- html_nodes(Docetaxel, '.user-type')

Patient5 <- html_text(Patient5_data_html, trim = TRUE)
Patient5 <- gsub(" .*","",Patient5)

comment5_data_html <- html_nodes(Docetaxel, 'b+ span')
comment_data5 <- html_text(comment5_data_html)

Rating5_data_html <- html_nodes(Docetaxel, 'tr:nth-child(2) .rating-score , .user-comment .rating-score')
Ratings5 <- as.numeric(html_text(Rating5_data_html, trim = TRUE))

Docetaxel_data <- data.frame(
  Patient = Patient5, Comment = comment_data5, Rating = Ratings5
)
write.xlsx(Letrozole_data, "Docetaxel_data.xlsx")

################################Carboplatin###############

url6 <- 'https://www.drugs.com/comments/carboplatin/'

Carboplatin <- read_html(url6)

Patient6_data_html <- html_nodes(Carboplatin, '.user-type')

Patient6 <- html_text(Patient6_data_html, trim = TRUE)
Patient6 <- gsub(" .*","",Patient6)

comment6_data_html <- html_nodes(Carboplatin, 'b+ span')
comment_data6 <- html_text(comment6_data_html)
comment_data6 <- gsub("\"","",comment_data6)

Rating6_data_html <- html_nodes(Carboplatin, 'tr:nth-child(2) .rating-score , .user-comment .rating-score')
Ratings6 <- as.numeric(html_text(Rating6_data_html, trim = TRUE))

Carboplatin_data <- data.frame(
  Patient = Patient6, Comment = comment_data6, Rating = Ratings6
)
write.xlsx(Carboplatin_data, "Carboplatin_data.xlsx")

##################################Paclitaxel########################

url7 <- 'https://www.drugs.com/comments/paclitaxel/'

Paclitaxel <- read_html(url7)

Patient7_data_html <- html_nodes(Paclitaxel, '.user-type')

Patient7 <- html_text(Patient7_data_html, trim = TRUE)
Patient7 <- gsub(" .*","",Patient7)

comment7_data_html <- html_nodes(Paclitaxel, 'b+ span')
comment_data7 <- html_text(comment7_data_html)
comment_data7 <- gsub("\"","",comment_data7)

Rating7_data_html <- html_nodes(Paclitaxel, '.user-comment .rating-score')
Ratings7 <- as.numeric(html_text(Rating7_data_html, trim = TRUE))

Paclitaxel_data <- data.frame(
  Patient = Patient7, Comment = comment_data7, Rating = Ratings7
)
write.xlsx(Paclitaxel_data, "Paclitaxel_data.xlsx")

#############################Gemcitabine###############
url8 <- 'https://www.drugs.com/comments/gemcitabine/'

Gemcitabine <- read_html(url8)

Patient8_data_html <- html_nodes(Gemcitabine, '.user-type')

Patient8 <- html_text(Patient8_data_html, trim = TRUE)
Patient8 <- gsub(" .*","",Patient8)

comment8_data_html <- html_nodes(Gemcitabine, 'b+ span')
comment_data8 <- html_text(comment8_data_html)
comment_data8 <- gsub("\"","",comment_data8)

Rating8_data_html <- html_nodes(Gemcitabine, '.user-comment .rating-score')
Ratings8 <- as.numeric(html_text(Rating8_data_html, trim = TRUE))

Gemcitabine_data <- data.frame(
  Patient = Patient8, Comment = comment_data8, Rating = Ratings8
)
write.xlsx(Gemcitabine_data, "Gemcitabine_data.xlsx")

################################Navelbine####################

url9 <- 'https://www.rxlist.com/script/main/rxlist_view_comments.asp?drug=navelbine&questionid=fdb1373_pem'
Navelbine <- read_html(url9)

Patient9_data_html <- html_nodes(Navelbine, '.commentFrom')

Patient9 <- html_text(Patient9_data_html, trim = TRUE)
Patient9 <- gsub("Comment from: ","",Patient9)
patient9 <- gsub(" (Patient)","",Patient9, fixed = TRUE)
patient9 <- gsub(", .*","",Patient9)

comment9_data_html <- html_nodes(Navelbine, '.patComment p')
comment_data9 <- html_text(comment9_data_html)

Navelbine_data <- data.frame(
  Patient = patient9, Comment = comment_data9
)
write.xlsx(Navelbine_data, "Navelbine_data.xlsx")

