require 'active_support/inflector'

class Words
    def initialize(str)
        @str = str
    end
    
    def to_a
        split_words
    end
    
    def split_words
        composite_words = @str.scan(/\w+/).flatten
        words = composite_words.collect  { |cword| cword.underscore.split('_') }.flatten
        words.collect { |word| word.downcase }
    end
    
    def count
        res = Hash.new(0)
        split_words.each { |word| res[word] += 1 }
        res
    end
end