require_relative 'words_counter'
require_relative 'hash_ext'

class TFIDF
    attr_reader :total_counter
    attr_reader :files_counters

    def initialize(pattern)
        @total_counter = WordsCounter.create_by_dir(pattern)
        @files_counters = WordsCounter.create_hash_by_dir(pattern)
    end
    
    def word_vectors
        words = word_selection
        files_counters.values.collect do |counter|
            word_vector(counter, words)
        end
    end
    
    def word_vector(counter, words)
        words.collect { |word| tfidf(counter, word) }
    end
    
    def tf(counter, word)
        1.0 * counter.count(word) / counter.max_count
    end
        
    def word_selection(limit = 10)
        result = terms_weight.sort_dec
        last = [limit, result.size].min
        result[0...last].collect { |word, w| word }
    end
    
    def terms_weight
        result = Hash.new(0.0)
        total_counter.words.each { |word| result[word] = tfidf(total_counter, word) }
        result
    end
    
    def tfidf(counter, word)
        tf(counter, word) * idf(word)
    end
        
    def idf(word)
        total = files_counters.size
        word_total = files_counters.values.inject(0) do |res, counter| 
            res += 1 if counter.has_word?(word)
            res 
        end
        word_total > 0 ? Math.log2(1.0*total/word_total) : 0
    end
end