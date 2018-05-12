# spiro_client.R

library(httr)
library(jsonlite)
library(magrittr)
library(ggplot2)

# base_url <- "http://localhost:8000"
base_url <- "https://beta.rstudioconnect.com/content/3533"


# Try the /spiro/plot GET endpoint

url <- paste0(base_url,"/spiro/calc")

result <- GET(url) %>%
  stop_for_status() %>%
  content("text",encoding="UTF-8") %>%
  fromJSON

ggplot(data=result, aes(x=x,y=y)) +
  geom_path() +
  xlab("Real(z)") + 
  ylab("Imag(z)")


# Try the /spiro/plot POST endpoint

url <- paste0(base_url,"/spiro/calc")
params <- list(n1 = 11, n2 = -7, n3 = -3)

result <- POST(url,body=params, encode="json") %>%
  stop_for_status() %>%
  content("text",encoding="UTF-8") %>%
  fromJSON

ggplot(data=result, aes(x=x,y=y)) +
  geom_path() +
  xlab("Real(z)") + 
  ylab("Imag(z)")


# Try the /spiro/plot endpoint

url <- paste0(base_url,"/spiro/plot?n1=13&n2=-7&n3=-3")

result <- GET(url) %>%
  stop_for_status() %>%
  content("raw")

png::readPNG(result) %>%
  png::writePNG(target="out.png")