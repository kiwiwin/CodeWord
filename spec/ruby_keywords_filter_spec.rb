require_relative 'spec_helper'

describe RubyKeywordsFilter do
    it "filt before_filter.rb to after_filter.rb" do
        RubyKeywordsFilter.filt(fixture_content("before_filter.rb")).should == fixture_content("after_filter.rb")
    end
end