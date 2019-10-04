# https://rstudio-pubs-static.s3.amazonaws.com/181112_a443bca1a0574232bdb9cf9fc89584ae.html
library(tidyverse)
data("diamonds")

summary(diamonds)
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

diamonds <- diamonds %>% filter(carat <= 2.2)

summary(diamonds)
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

fit <- lm(formula = price ~ carat, data = diamonds)
summary(fit)

res <- data.frame(predicted = fitted.values(fit),
                  residuals = residuals(fit))
ggplot(res, aes(x = predicted, y = residuals)) + geom_point()

ggplot(diamonds, aes(x = log(carat), y = log(price))) + geom_point()

fit_log <- lm(log(price) ~ log(carat), diamonds)
summary(fit_log)

res_log <- data.frame(predicted = fitted.values(fit_log),
                      residuals = residuals(fit_log))
ggplot(res_log, aes(x = predicted, y = residuals)) + geom_point()

fit_final <- lm(log(price) ~ log(carat) + cut + color + clarity, diamonds)
summary(fit_final)

confint(fit_final)

res_final <- data.frame(predicted = fitted.values(fit_final),
                        residuals = residuals(fit_final))
ggplot(res_final, aes(x = predicted, y = residuals)) + geom_point()