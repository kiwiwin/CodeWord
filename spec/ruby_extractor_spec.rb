require_relative 'spec_helper'

describe RubyExtractor do
    it "should return RubyClassName for class name" do
        RubyExtractor.new(fixture_content("ruby_class_name.rb")).class_name.should == ['RubyClassName']
    end
end