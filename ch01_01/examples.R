#pg 6
hello <- "Hello"
world <- "World"
paste(hello, world)

greet <- function (name) { print(paste(hello, name)) }
greet("Mike")

name <- readline()
greet(name)

birthday <- function (name) { print(paste0("Happy birthday ",name,"!")) }
birthday("Jack")