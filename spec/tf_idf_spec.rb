require_relative 'spec_helper'

describe TFIDF do
    before(:each) do
        @tfidf = TFIDF.new(fixture_path + "/txt/**/*.txt")
    end

    it "should select a c as top 2 word" do
        @tfidf.word_selection(2).should == ['a', 'c']
    end
    
    it "should return terms_weight" do
        @tfidf.terms_weight.should == { 'b' => 0.0, 'a' => 0.5, 'c' => 0.5}
    end
    
    it "should return vsm" do
        @tfidf.word_selection.should == ['a', 'c', 'b']
        @tfidf.word_vectors.should == [[0.0, 1.0, 0.0], [1.0, 0.0, 0.0]]
    end 
end