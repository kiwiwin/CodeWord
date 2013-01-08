require 'active_support/inflector'

class WordsCounter
    attr_reader :words_count

    def initialize(arr)
        @words_count = Hash.new(0)
        add_words(arr)
    end
        
    def add_words(new_words)
        new_words.each { |word| @words_count[word] += 1 }
    end
    
    class << self
        def split_words(str)
            composite_words = str.scan(/\w+/).flatten
            words = composite_words.collect  { |cword| cword.underscore.split('_') }.flatten
            words.collect { |word| word.downcase }
        end
        
        def create(str)
            WordsCounter.new(split_words(str))
        end
    end
end