require File.dirname(__FILE__) + '/test_helper'

require 'holidays/ca'

# Re-include CA defs via holidays/north_america to ensure that individual
# defs aren't duplicated.
require 'holidays/north_america'

class HolidaysTests < Test::Unit::TestCase
  def setup
    @date = Date.civil(2008,1,1)
  end

  def test_on
    h = Holidays.on(Date.civil(2008,9,1), :ca)
    assert_equal 'Labour Day', h[0][:name]

    holidays = Holidays.on(Date.civil(2008,7,4), :ca)
    assert_equal 0, holidays.length
  end

  def test_between
    holidays = Holidays.between(Date.civil(2008,7,1), Date.civil(2008,7,1), :ca)
    assert_equal 1, holidays.length

    holidays = Holidays.between(Date.civil(2008,7,1), Date.civil(2008,7,31), :ca)
    assert_equal 1, holidays.length
    
    holidays = Holidays.between(Date.civil(2008,7,2), Date.civil(2008,7,31), :ca)
    assert_equal 0, holidays.length
  end

  def test_requires_valid_regions
    assert_raises Holidays::UnkownRegionError do
      Holidays.on(Date.civil(2008,1,1), :xx)
    end

    assert_raises Holidays::UnkownRegionError do
      Holidays.on(Date.civil(2008,1,1), [:ca,:xx])
    end

    assert_raises Holidays::UnkownRegionError do
      Holidays.between(Date.civil(2008,1,1), Date.civil(2008,12,31), [:ca,:xx])
    end
  end

  def test_region_params
    holidays = Holidays.on(@date, :ca)
    assert_equal 1, holidays.length

    holidays = Holidays.on(@date, [:ca_bc,:ca])
    assert_equal 1, holidays.length
  end
  
  def test_observed_dates
    # Should fall on Tuesday the 1st
   assert_equal 1, Holidays.on(Date.civil(2008,7,1), :ca, :observed).length

    # Should fall on Monday the 2nd
    assert_equal 1, Holidays.on(Date.civil(2007,7,2), :ca, :observed).length
  end

  def test_any_region
    # Should return Victoria Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca)
    assert_equal 1, holidays.length

    # Should return Victoria Day and National Patriotes Day.
    #
    # Should be 2 in the CA region but other regional files are loaded during the
    # unit tests add to the :any count.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), [:any])
    assert holidays.length >= 2

    # Test blank region
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31))
    assert holidays.length >= 3
  end
  
  def test_sub_regions
    # Should return Victoria Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca)
    assert_equal 1, holidays.length

    # Should return Victoria Da and National Patriotes Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca_qc)
    assert 2, holidays.length

    # Should return Victoria Day and National Patriotes Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca_)
    assert_equal 2, holidays.length
  end

  def test_easter_sunday
    assert_equal '1800-04-13', Holidays.easter(1800).to_s
    assert_equal '1899-04-02', Holidays.easter(1899).to_s
    assert_equal '1900-04-15', Holidays.easter(1900).to_s
    assert_equal '1999-04-04', Holidays.easter(1999).to_s
    assert_equal '2000-04-23', Holidays.easter(2000).to_s
    assert_equal '2025-04-20', Holidays.easter(2025).to_s
    assert_equal '2035-03-25', Holidays.easter(2035).to_s
    assert_equal '2067-04-03', Holidays.easter(2067).to_s
    assert_equal '2099-04-12', Holidays.easter(2099).to_s
  end

  def test_easter_lambda
    [Date.civil(1800,4,11), Date.civil(1899,3,31), Date.civil(1900,4,13),
     Date.civil(2008,3,21), Date.civil(2035,3,23)].each do |date|
      assert_equal 'Good Friday', Holidays.on(date, :ca)[0][:name]
    end

    [Date.civil(1800,4,14), Date.civil(1899,4,3), Date.civil(1900,4,16),
     Date.civil(2008,3,24), Date.civil(2035,3,26)].each do |date|
      assert_equal 'Easter Monday', Holidays.on(date, :ca_qc, :informal)[0][:name]
    end
  end
end
