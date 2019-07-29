LDAmodel <- function(news_dataframe, Ktopics, niter){
  download.file("http://jmlr.org/papers/volume5/lewis04a/a11-smart-stop-list/english.stop", "stopwords-en.txt")
  library(mallet)
  instance <- mallet.import(news_dataframe$url, news_dataframe$text, "stopwords-en.txt")
  model <- MalletLDA(num.topics = Ktopics)
  model$loadDocuments(instance)
  freqs <- mallet.word.freqs(model)
  print(class(freqs))
  # train a model with niter #iterations
  model$train(niter)
  return(model)
}