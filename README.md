# inside-OLS
This repository provides a simulation of Ordinary Least-Squares (OLS) in Mata.

I assume that the reader has some basic knowledge using STATA and has an introductory understanding of matrix algebra and the matrix linear regression model.

Mata is a matrix programming language that can be used by those who want to perform matrix calculations interactively and by those who want to add new features to Stata.

In this case, this simulation can be useful as a replication of the beta coefficients in a regression analysis through OLS in Mata.

## Introduction
In matrix form, the sample regression function is:

$$
\hat{\\mathbf{Y}} = \\mathbf{X}\mathbf{\beta}+\mathbf{\epsilon}
$$
    
and the least-square estimator can be expressed as:

$$
\mathbf{B} =\mathbf{X}'\mathbf{X}^{-1}\mathbf{X}'\mathbf{Y} 
$$

## Data
The user must first prepare the data for analysis. Load the exercise data, stored in a file called auto2.dta, which is included in STATA.

```s
clear
sysuse auto2.dta
```
Now enter the Mata prompt to finally view the data in Stata’s memory as a matrix, and then clear Mata’s memory:



```s
mata
mata clear
```

Thus, generate the vectors of dependent and independent variables.

```s
X = st_data(.,"weight") // covariate var
X = X, J(rows(X),1,1) //constant term
Y = st_data(.,"mpg") // dependent var
```

Finally, estimate the beta coefficient by using the same matrix expression above and exit the Mata session in order to return to STATA

```s
beta = luinv(X'*X)*X'*Y
beta

end
```

## Compare results

In conclusion, compare the results using the Matrix Linear Regression Model in Mata to the results using the Scalar Linear Regression Model in Stata.

```s
reg mpg weight //verify
```

