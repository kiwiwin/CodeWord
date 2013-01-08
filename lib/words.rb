class Words
    def initialize(str)
        @str = str
    end
    
    def to_a
        words = @str.unCamel.flatten
        words.collect { |word| word.downcase }
    end
end

class String
    def unCamel
        scan(/([A-Za-z][a-z]*)/)
    end
end