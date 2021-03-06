require File.dirname(__FILE__) + '/../test_helper'
require 'holidays/ie'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: data/ie.yaml
class IeDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_ie
{Date.civil(2008,1,1) => 'New Year\'s Day', 
 Date.civil(2008,3,17) => 'St. Patrick\'s Day',
 Date.civil(2008,3,24) => 'Easter Monday',
 Date.civil(2008,5,5) => 'May Day',
 Date.civil(2008,6,2) => 'Bank Holiday',
 Date.civil(2008,8,4) => 'Bank Holiday',
 Date.civil(2008,12,25) => 'Christmas Day',
 Date.civil(2008,12,26) => 'St. Stephen\'s Day'}.each do |date, name|
  assert_equal name, Holidays.on(date, :ie, :informal)[0][:name]
end
  end
end
