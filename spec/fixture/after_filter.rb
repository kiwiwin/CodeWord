require 'require_all'
require_all 'lib'

 fixture(file_name)
    "#{fixture_path}/#{file_name}"


 fixture_path
    File.dirname() + "/fixture"
