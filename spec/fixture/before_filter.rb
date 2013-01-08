require 'require_all'
require_all 'lib'

def fixture(file_name)
    "#{fixture_path}/#{file_name}"
end

def fixture_path
    File.dirname(__FILE__) + "/fixture"
end