require 'classifier-reborn'
# Initialize and supply two categories: 'Interesting' and 'Uninteresting'
classifier = ClassifierReborn::Bayes.new('Interesting', 'Uninteresting')
# Supply text to train the classifier for 'Interesting'
classifier.train_interesting("here are some good words. I hope you love them")
# Supply text to train the classifier for 'Uninteresting'
classifier.train_uninteresting("here are some bad words, I hate you")
# Supply novel text and ask for classification
puts classifier.classify("I hate bad words and you")
puts classifier.classify_with_score("I hate bad words and you")
