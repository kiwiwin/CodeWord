require_relative 'spec_helper'

describe WordsCounter do
    it "should return WordsCounter split by space" do
        WordsCounter.split_words("a b c").should == ['a', 'b', 'c']
    end
    
    it "should return WordsCounter as downcase" do
        WordsCounter.split_words("Hello").should == ['hello']
    end
    
    it "should return WordsCounter split by camel style start with downcase" do
        WordsCounter.split_words("getSomething").should == ['get', 'something']
    end
    
    it "should return WordsCounter split by camel style start with upcase" do
        WordsCounter.split_words("GetSomething").should == ['get', 'something']
    end
    
    it "should ignore grammer" do
        WordsCounter.split_words("String.new").should == ['string', 'new']
    end
    
    it "should recognize abbreviation" do
        WordsCounter.split_words("HttpXMLRequest").should == ['http', 'xml', 'request']
    end
    
    it "test hello world cpp" do
        expected = ['include', 'iostream', 'using', 'namespace', 'int', 'main', 'cout', 'hello', 'world', 'endl']
        file_content = open(fixture("hello_world.cpp")).read
        WordsCounter.split_words(file_content).should == expected
    end
    
    it "test hello world java" do
        expected = ['public', 'class', 'hello', 'world', 'public', 'static', 'void', 'main', 'string', 
        'args', 'system', 'out', 'println', 'hello', 'world']
        file_content = open(fixture("hello_world.java")).read
        WordsCounter.split_words(file_content).should == expected
    end
    
    it "test word count each word appear only once" do
        WordsCounter.new(['a','b','c']).words_count.should == { 'a' => 1, 'b' => 1, 'c' => 1}
    end
    
    it "test word a appear 3 times" do
        WordsCounter.new(['a','a','a']).words_count.should == { 'a' => 3 }
    end
end