class RubyKeywordsFilter
    class << self
        attr_reader :keywords
    
        def init_keywords
            @keywords = open(File.dirname(__FILE__) + "/keywords/rb").read.split("\n")
        end
    
        def filt(str)
            result = str
            init_keywords if !@keywords
            @keywords.each do |keyword|
                result.gsub!(keyword, '')
            end
            result
        end
    end
end