class RubyExtractor
    def initialize(content)
        @content = content
    end
    
    def class_name
        @content.scan(/class\s+(\w+)/).flatten
    end
end