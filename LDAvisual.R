LDAvisual <- function(model2, Ktopics, quarter){  # Here, we compute the estimated topic-term distribution, incorporating the effect
  # of the prior using 'smoothed = TRUE'.
  phi <- t(mallet.topic.words(model2, smoothed = TRUE, normalized = TRUE))
  # Let's look at the table of topics and terms by setting 'normalized = FALSE'
  phi.count <- t(mallet.topic.words(model2, smoothed = TRUE, normalized = FALSE))
  # Now get the smoothed estimates of the document-topic distributions:
  topic.words <- mallet.topic.words(model2, smoothed = TRUE, normalized = FALSE)
  # 'count' of the number of tokens per topic (including pseudo-tokens from the priors)
  topic.counts <- rowSums(topic.words)
  topic.proportions <- topic.counts/sum(topic.counts)
  vocab <- model2$getVocabulary()
  
  library(LDAvis)
  term.frequency <- apply(phi.count, 1, sum)
  
  json <- createJSON(K = Ktopics, phi, term.frequency, vocab, topic.proportions)
  out_dir <- paste(getwd(), quarter, sep='/')
  serVis(json, out.dir = out_dir, open.browser = FALSE)
}