library("car")
library("ggplot2")
set.seed(123125)
data("Duncan")

# Select folds for each observation
#' Number of observations
n <- nrow(Duncan)
# Number of folds
n_folds <- 5
#' Folds for each observation
#' Using the remainder of dividing by number of folds gives equal numbers
#' Using sample shuffles the observations.
fold <- sample((seq_len(n) %% n_folds) + 1)

#' Formula for the model
form <- prestige ~ education 

# Vector to hold MSE of the folds
mse_folds <- rep(NA, n_folds)

# Loop through each fold
for (i in seq_len(n_folds)) {
  # Test obervations
  test_data <- Duncan[which(fold == i), ]
  # Training observations
  training_data <- Duncan[which(fold != i), ]
  # estimate model on training data
  mod <- lm(form, data = training_data)
  # Get residuals for predictions
  mse_folds[i] <- mean(residuals(mod, newdata = mod) ^ 2)
}
cv_mse <- mean(mse_folds)

#' But the point of using Cross-Validation is to compare several models
#' 
#' We could copy-and paste the code above, and change the formula each time.
#' Instead, we will use a for-loop to run the model for a set of models
#' 

#' Store models in a list
formulae <- list(prestige ~ education,
                 prestige ~ income,
                 prestige ~ type,
                 prestige ~ income + education,
                 prestige ~ income + education + type,
                 prestige ~ type * (income + education),
                 prestige ~ (type + income + education) ^ 2)

#' Run the model for each formula
models <- list()
for (i in seq_along(formulae)) {
  models[[i]] <- lm(formulae[[i]], data = Duncan)
}
# Example: model 1
models[[1]]

#' Dataset
dataset <- Duncan
#' Use 10-fold cross-validation
n_folds <- 10

#' Loop over each model, and calculate cross-validated MSE
model_cv <- list()
for (i in seq_along(models)) {
  #' Extract the formula from the model
  form <- as.formula(models[[i]])
  cat("Running model: ", format(form), "\n")
  #' number of obs
  n <- nrow(dataset)
  #' folds
  fold <- sample((seq_len(n) %% n_folds) + 1)
  #' dependent variable in the model
  yvar <- as.character(form[[2]])
  # Vector to hold MSE of the folds
  mse_folds <- rep(NA, n_folds)
  # Loop through each fold
  for (k in seq_len(n_folds)) {
    # Test obervations
    data_test <- dataset[which(fold == k), , drop = FALSE]
    # Training observations
    data_train <- dataset[which(fold != k), , drop = FALSE]
    # estimate model on training data
    mod_train <- lm(form, data = data_train)
    # Predicted values for new data
    yhat <- predict(mod_train, newdata = data_test)
    # Prediction erorrs
    err <- yhat - data_test[[yvar]]
    # Mean squared error
    mse_folds[k] <- mean(err ^ 2)
  }
  # Cross-validated MSE for that model
  cv_mse <- mean(mse_folds)

  # In-sample MSE
  mse_train <- mean(residuals(models[[i]]) ^ 2)

  # Save results in a data frame
  model_cv[[i]] <- data_frame(model = i,
                         formula = format(form),
                         mse_cv = cv_mse,
                         mse_train = mse_train)
}
model_cv <- bind_rows(model_cv)

model_cv
  



#' Other functions:
#' 
#' - package boot: function cv.glm
#' - package DAAG: cv.lm
#' - packages: caret, mlr

