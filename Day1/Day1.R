rm(list = ls())
setwd("Day1/Input/")
library(dplyr)

# --- Data ---
input1 <- scan("input1.txt", what = numeric())

# --- Functions ---
increase <- function(x) {
  return(x - lag(x))
}

increase3 <- function(x) {
  last_index <- length(x) - 2
  # Matrix with three-range values
  mx <- sapply(1:last_index, function(i) x[i:(i+2)])
  # Cumsum vector
  cumx <- colSums(mx)
  # Increase
  return(increase(cumx))
}

# --- Code ---
# Count the number of times a depth measurement increases from the previous 
# measurement
sum(na.omit(increase(input1)) > 0)

# Count the number of times the sum of measurements in a sliding window of 3
# increases
sum(na.omit(increase3(input1)) > 0)
