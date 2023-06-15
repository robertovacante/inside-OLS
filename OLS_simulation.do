clear

sysuse auto2.dta

mata
mata clear

X = st_data(.,"weight") // covariate var
X = X, J(rows(X),1,1) //constant term

Y = st_data(.,"mpg") // dependent var
beta = luinv(X'*X)*X'*Y
beta

end

reg mpg weight //verify
