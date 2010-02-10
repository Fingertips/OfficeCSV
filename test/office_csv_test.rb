require 'rubygems'
require 'test/unit'

$:.unshift File.expand_path('../../lib', __FILE__)

require 'office_csv'

class OfficeCSVTest < Test::Unit::TestCase
  ROW = ['Über', 'den', 'Engeln']
  CSV = "\377\376\334\000b\000e\000r\000\t\000d\000e\000n\000\t\000E\000n\000g\000e\000l\000n\000\n\000"
  
  def test_generates
    csv = OfficeCSV.generate do |row|
      row << ROW
    end
    assert_equal CSV, csv
  end
  
  def test_parse
    rows = OfficeCSV.parse(CSV)
    assert_equal ROW, rows[0]
  end
end