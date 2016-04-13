library("dplyr")
library("ggplot2")
library("broom")
library("car")
data("Duncan")

# Example with Discrete Variable

ggplot(Duncan, aes(x = type, y = prestige)) +
  geom_point()

Duncan %>%
  group_by(type) %>%
  summarize(prestige_mean = mean(prestige))

# Example with continuous variable
ggplot(Duncan, aes(x = education, y = prestige)) +
  geom_point()

# Method 1
cef_education_all <-
  Duncan %>%
  group_by(education) %>%
  summarize(prestige = mean(prestige))

ggplot(cef_education_all, aes(x = education, y = prestige)) +
  geom_point() +
  geom_line()

# Method 2
# Stratify. 2 categories.
n_strata <- 10
cef_education_strata <-
  Duncan %>%
  mutate(education = cut(education, n_strata)) %>%
  group_by(education) %>%
  summarize(prestige = mean(prestige))

ggplot(cef_education_strata, aes(x = education, y = prestige)) +
  geom_point() +
  geom_line()

# What happens as you increase categories?

# Method 3
# Linear Regression
lm_education <- lm(prestige ~ education, data = Duncan)
lm_education_aug <- augment(lm_education)

ggplot(lm_education, aes(x = education, y = .fitted)) +
  geom_line()

# Bias / Variance Tradeoff
# Linear Regression
lm_bootstrap <- 
  Duncan %>%
    bootstrap(20) %>%
    do(select(augment(lm(prestige ~ education, data = .)),
                      education, .fitted))
ggplot(lm_bootstrap, aes(x = education, y = .fitted, group = replicate)) +
  geom_line()

n_strata <- 5
strata_bootstrap <-
  Duncan %>%
  mutate(strata = cut(education, n_strata)) %>%
  bootstrap(20) %>%
  do({
      group_by(., strata) %>%
      summarize_each(funs(mean), prestige)
  })

ggplot(strata_bootstrap, aes(x = strata, y = prestige, group = replicate)) +
  geom_line() + 
  geom_point()

  