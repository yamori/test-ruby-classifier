require 'classifier-reborn'

trainingFilename = 'training.txt'

categories = []

# Read the categories
File.open(trainingFilename).each do |line|
  tokens = line.split(':')

  # Skip the line if not enough tokens
  if tokens.size!=2 then next end

  category = tokens[0].strip.downcase

  if !categories.include?(category) then categories.push(category) end
  phrase = tokens[1].strip
end

puts "<-- #{categories.size} Categories"
puts " #{categories.inspect}"

classifier = ClassifierReborn::Bayes.new(categories)

# Training the LSI
File.open(trainingFilename).each do |line|
  tokens = line.split(':')

  # Skip the line if not enough tokens
  if tokens.size!=2 then next end

  category = tokens[0].strip.downcase
  phrase = tokens[1].strip

  # Train
  classifier.train(category, phrase)
end

# Marshall and save classifier as a *.dat
outFilename = 'classifier.dat';
classifier_data = Marshal.dump(classifier)
File.open(outFilename, "w") {|f| f.write(classifier_data)}

puts "<-- Classifier written"
puts " #{outFilename}"
