#Read file
greecefire <- read.csv(file.choose(), header = T)
str(greecefire)
# Build corpus
library(tm)
corpus <- iconv(greecefire$text, to = 'UTF-8', sub = "byte")
corpus <- Corpus(VectorSource(corpus))
inspect(corpus[1:5])
# Clean text
text_corpus <- VCorpus(VectorSource(text))
corpus <- tm_map(corpus, tolower)
inspect(corpus[1:5])
corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:5])
corpus <- tm_map(corpus, removeNumbers)
inspect(corpus[1:5])
cleanset <- tm_map(corpus, removeWords, stopwords('english'))
inspect(cleanset[1:5])
removeURL <- function(x) gsub('http[[:alnum:]]*', '', x)
cleanset <- tm_map(cleanset, content_transformer(removeURL))
inspect(cleanset[1:5])
cleanset <- tm_map(cleanset, removeWords, c('ngreecefire', 'greecefire'))
inspect(cleanset[1:5])
cleanset <- tm_map(cleanset, removeWords, c('ngreeceisburning', 'greecefire'))
inspect(cleanset[1:5])
cleanset <- tm_map(cleanset, stripWhitespace)
inspect(cleanset[1:5])
# Term document matrix
tdm <- TermDocumentMatrix(cleanset)
tdm <- as.matrix(tdm)
tdm[1:1000, 1:25]
# Bar plot
w <- rowSums(tdm)
w <- subset(w, w>=25)
barplot(w,las = 2,col = rainbow(50))
# Read file
greecefire <- read.csv(file.choose(), header = T)
tweets <- iconv(greecefire$text, to = 'UTF-8', sub = "byte")
