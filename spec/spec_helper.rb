require 'require_all'
require_all 'lib'

def fixture(file_name)
    File.dirname(__FILE__) + "/fixture/#{file_name}"
end