LoadLIB<-function(lib)
{
  Falselib<-lib[!is.element(lib, installed.packages()[,1])]
  if(length(Falselib)>0) 
  {
    print(Falselib)
    message("Check if you have denoted libraries above");
    message("You must install those packages to run the code ! thank you !")
    message("run install.packages(lib) to install the libraries")
  }
  lapply(lib, require, character.only = TRUE)
} 
