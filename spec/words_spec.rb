require_relative 'spec_helper'

describe Words do
    it "should return words split by space" do
        Words.new("a b c").to_a.should == ['a', 'b', 'c']
    end
    
    it "should return words as downcase" do
        Words.new("Hello").to_a.should == ['hello']
    end
    
    it "should return words split by camel style start with downcase" do
        Words.new("getSomething").to_a.should == ['get', 'something']
    end
    
    it "should return words split by camel style start with upcase" do
        Words.new("GetSomething").to_a.should == ['get', 'something']
    end
    
    it "should ignore grammer" do
        Words.new("String.new").to_a.should == ['string', 'new']
    end
    
    it "test hello world cpp" do
        expected = ['include', 'iostream', 'using', 'namespace', 'int', 'main', 'cout', 'hello', 'world', 'endl']
        Words.new(open(fixture("hello_word.cpp")).read).to_a.should == expected
    end
end