require 'active_support/inflector'

class WordsCounter
    attr_reader :words_count

    def initialize(arr = [])
        @words_count = Hash.new(0)
        add_words(arr)
    end
        
    def add_words(new_words)
        new_words.each { |word| @words_count[word] += 1 }
    end
    
    def merge(counter)
        @words_count.merge!(counter.words_count) { |key, old_val, new_val| old_val + new_val }
    end
    
    def rank
        @words_count.sort { |lhs, rhs| rhs[1] <=> lhs[1] }
    end
    
    class << self
        def split_words(str)
            composite_words = str.scan(/[A-Za-z]+/).flatten
            words = composite_words.collect  { |cword| cword.underscore.split('_') }.flatten
            words.collect { |word| word.downcase }
        end
        
        def create(str)
            WordsCounter.new(split_words(str))
        end
        
        def create_by_file(filename)
            create(open(filename).read)
        end
        
        def create_by_dir(pattern)
            result = WordsCounter.new
            Dir[pattern].each do |file|
                result.merge(create_by_file(file))
            end
            result
        end
    end
end