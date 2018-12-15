require 'decisiontree'
# Specify type ("discrete" or "continuous") in the training data
labels = ["recent1","recent2","recent3","recent4","recent5","current"]
cosi = [    [1, "None","None","None","None","None","COSI 11a"],
            [1, "None","None","None","None","COSI 11a","COSI 12b"],
            [2, "None","None","None","COSI 11a","COSI 12b","COSI 21a"],
            [2, "None","None","COSI 11a","COSI 12b","COSI 21a","COSI 29a"],
            [2, "None","None","COSI 11a","COSI 29a","COSI 12b","COSI 21a"],
            [1, "None","None","None","None","COSI 11a","COSI 12b"],
            [3, "COSI 29a","COSI 21a","COSI 101a","COSI 130a","COSI 166b","COSI 131a"],
            [2, "None","None","None","None","COSI 11a","COSI 21a"],
            [3, "COSI 12b","COSI 164a","COSI 29a","COSI 21a","COSI 130a","COSI 131a"],
            [2, "None","None","None","None","None","COSI 11a"],
            [4, "None","None","MATH 8a","COSI 11a","COSI 12b","COSI 21a"],
            [4,"MATH 23a","COSI 21a","COSI 155b","COSI 123a","COSI 130a","COSI 131a"],
            [3,"COSI 11a","COSI 12b","COSI 29a","COSI 21a","COSI 130a","COSI 131a"],
            [2,"None","COSI 11a","COSI 12b","COSI 118a","COSI 29a","COSI 21a"],
            [4,"COSI 101a","COSI 121b","COSI 155b","COSI 130a","COSI 165a","COSI 131a"],
            [2,"COSI 12b","COSI 130a","COSI 164a","COSI 155a","COSI 21a","COSI 29a"],
]
dec_tree = DecisionTree::ID3Tree.new(labels, cosi, "COSI 11a", current: :discrete, recent1: :discrete, recent2: :discrete, recent3: :discrete, recent4: :discrete,recent5: :discrete)
dec_tree.train

test = [2,"None","None","COSI 11a","COSI 12b","COSI 29a","COSI 21a"]

decision = dec_tree.predict(test)
puts "Predicted: #{decision} ... True decision: #{test.last}"
