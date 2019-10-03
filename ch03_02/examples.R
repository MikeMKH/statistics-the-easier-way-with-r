data("mtcars")
summary(mtcars)
pairs(mtcars)

model <- aov(mpg ~ cyl + disp * hp * wt * qsec, data=mtcars)
summary(model)