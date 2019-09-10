#pg 45
library(tidyverse)
fitts <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQzmp_ok7b5sQTlJrdrYxE7NvsnStN1qkDCpWoAOnoPKzIE9izqWAcfLgQRy4LcejKwredCe0yFVdR3/pub?gid=106072055&single=true&output=csv")
summary(fitts)
str(fitts)

#pg 47-48
library(googlesheets)

# https://docs.google.com/spreadsheets/d/1tykXpknyrpu25Z6kWM55iVxKihV2ZkLhuj4ZDyCV7w8/
key <- "1tykXpknyrpu25Z6kWM55iVxKihV2ZkLhuj4ZDyCV7w8"
gs <- gs_key(key)
mnms <- as.data.frame(gs_read(gs))
head(mnms)

#pg 49
url <- "https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/comp-temps.csv"
temps <- read.csv(url)
head(temps)

#pg 50
machine <- read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/cpu-performance/machine.data")
head(machine)

#pg 52
data("iris")
tail(iris)
str(iris)

#pg 53
library(rjson)
json.file <- "https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/example.json"
json.data <- fromJSON(paste(readLines(json.file), collapse=""))
str(json.data)
json.data