topicProportions <- function(model){
  phi <- t(mallet.topic.words(model, smoothed = TRUE, normalized = TRUE))
  # Let's look at the table of topics and terms by setting 'normalized = FALSE'
  phi.count <- t(mallet.topic.words(model, smoothed = TRUE, normalized = FALSE))
  # Now get the smoothed estimates of the document-topic distributions:
  topic.words <- mallet.topic.words(model, smoothed = TRUE, normalized = FALSE)
  # 'count' of the number of tokens per topic (including pseudo-tokens from the priors)
  topic.counts <- rowSums(topic.words)
  topic.proportions <- topic.counts/sum(topic.counts)
  return(topic.proportions)
}