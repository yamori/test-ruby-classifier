require 'classifier-reborn'

# Load the Marshall'd data file
data = File.read('classifier.dat')

# Unmarshal
classifier = Marshal.load(data)

# Classify
puts classifier.classify_with_score("Giant grocery store")
