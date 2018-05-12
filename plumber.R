source('spirograph.R')

#* Calculate the default x and y values for a 3 wheeled Spirograph.
#* @get /spiro/calc
#* @json
function(){
  return(spiro())
}

#* Calculate the x and y values for a 3 wheeled Spirograph.
#* @post /spiro/calc
#* @param n3 Characteristics for the third wheel
#* @param n2 Characteristics for the second wheel
#* @param n1 Characteristics for the first wheel
#* @json
function(n1,n2,n3){
  return(spiro(as.numeric(n1),as.numeric(n2),as.numeric(n3)))
}

#* Plot the x and y values for a 3 wheeled Spirograph
#* @get /spiro/plot
#* @param n3 Characteristics for the third wheel
#* @param n2 Characteristics for the second wheel
#* @param n1 Characteristics for the first wheel
#* @png
function(n1,n2,n3){
  result <- spiro(as.numeric(n1),as.numeric(n2),as.numeric(n3))
  plot(result$x, result$y, xlab="Real(z)", ylab="Imag(z)")
}
