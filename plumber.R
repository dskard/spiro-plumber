source('spirograph.R')

#* Calculate the default x and y values for a 3 wheeled Spirograph.
#* @get /spiro/calc
#* @json
function(){
  return(spiro())
}

#* Calculate the x and y values for a 3 wheeled Spirograph and return the results as a JSON object.
#* @post /spiro/calc
#* @param n3 Characteristics for the third wheel
#* @param n2 Characteristics for the second wheel
#* @param n1 Characteristics for the first wheel
#* @json
function(n1,n2,n3){
  return(spiro(as.numeric(n1),as.numeric(n2),as.numeric(n3)))
}

#* Plot the x and y values for a 3 wheeled Spirograph and return a PNG file
#* @get /spiro/plot
#* @param n3 Characteristics for the third wheel
#* @param n2 Characteristics for the second wheel
#* @param n1 Characteristics for the first wheel
#* @png
function(n1,n2,n3){
  result <- spiro(as.numeric(n1),as.numeric(n2),as.numeric(n3))
  plot(result$x, result$y, xlab="Real(z)", ylab="Imag(z)")
}

#* Calculate the x and y values for a 3 wheeled Spirograph and return an Excel spreadsheet with the results.
#* @post /spiro/xlsx
#* @param n3 Characteristics for the third wheel
#* @param n2 Characteristics for the second wheel
#* @param n1 Characteristics for the first wheel
#* @serializer contentType list(type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
function(n1,n2,n3){
  result <- spiro(as.numeric(n1),as.numeric(n2),as.numeric(n3))
  tmp <- writexl::write_xlsx(result)
  # return the binary data
  readBin(tmp,"raw",n=file.info(tmp)$size )
}
