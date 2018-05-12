library(plumber)

r <- plumb("plumber.R")
r$run(port=8000)

# try it from the terminal with:
# curl -X GET "http://localhost:8000/spiro/calc"
# curl -X POST --data "n1=11&n2=-7&n3=-3" "http://localhost:8000/spiro/calc"
# curl -X GET "http://localhost:8000/spiro/plot?n1=11&n2=-7&n3=-3"

# publish to RStudio Connect with:
# rsconnect::deployAPI(api=getwd())

# try the published version with:
# curl -X GET "https://beta.rstudioconnect.com/content/3533/spiro/calc"
# curl -X POST --data "n1=11&n2=-7&n3=-3" "https://beta.rstudioconnect.com/content/3533/spiro/calc"
# curl -X GET "https://beta.rstudioconnect.com/content/3533/spiro/plot?n1=11&n2=-7&n3=-3"

# try the published version in your web browser:
# https://beta.rstudioconnect.com/content/3533/spiro/calc
# https://beta.rstudioconnect.com/content/3533/spiro/plot?n1=11&n2=-7&n3=-3
