##Title Getter

title_getter <- function(url){
  
  url_1 <- read_html(url)
  title <- url_1 %>%  html_nodes("title") %>% html_text()
  url_2 <- url
  title_1 <- title
  data_frame_start <- data.frame(url_2, title_1)
  as.data.frame(return(data_frame_start))
  
}

url <- unlist(final_url[2:nrow(final_url),])

url <- unlist(url_3)

zz <- purrr::map(url, possibly(title_getter, NA))

zz_without_NA_Logical <- zz[!is.na(zz) & !is.logical(zz)]

final_dataframe_titles<- bind_rows(zz_without_NA_Logical, .id = "column_label")




simple <- read_html("https://www.youtube.com/watch?v=JdNE3DKaIAc")

simple %>% html_nodes("title") %>% html_text()
url <- "https://www.youtube.com/watch?v=JdNE3DKaIAc"
testo <- title_getter(url = url)
