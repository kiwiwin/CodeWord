require 'active_support/inflector'
require_relative 'hash_ext'

class WordsCounter
    attr_reader :words_count

    def initialize(arr = [])
        @words_count = Hash.new(0)
        add_words(arr)
    end
        
    def add_words(new_words)
        new_words.each { |word| @words_count[word] += 1 }
    end
    
    def merge!(counter)
        @words_count.merge!(counter.words_count) { |key, old_val, new_val| old_val + new_val }
    end
    
    def rank
        @words_count.sort_dec
    end
    
    def words_rank
        rank.collect { |word, count| word }
    end
    
    def count_rank
        rank.collect { |word, count| count }
    end
    
    def count(word)
        @words_count[word]
    end
    
    def max_count
        count_rank[0]
    end
    
    def words
        @words_count.keys
    end
    
    def has_word?(word)
        @words_count.has_key?(word)
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
        
        def create_hash_by_dir(pattern)
            result = Hash.new
            Dir[pattern].each do |file|
                result[file] = WordsCounter.create_by_file(file)
            end
            result
        end
        
        def create_by_dir(pattern)
            result = WordsCounter.new
            Dir[pattern].each do |file|
                result.merge!(create_by_file(file))
            end
            result
        end
    end
end