require 'fastercsv'
require 'iconv'

class OfficeCSV
  # Works just like FasterCSV.generate. It adds a byte order mark to the beginning of the document and
  # converts the contents from UTF-8 to UTF-16LE.
  def self.generate(&block)
    [0xff, 0xfe].pack('C*') + Iconv.iconv('UTF-16LE', 'UTF-8',
      FasterCSV.generate(:col_sep => "\t", &block)
    ).join
  end
  
  # Just like FastCSV.parse. It removes the byte order mark and transcodes from UTF-16LE to UTF-8.
  def self.parse(csv)
    FasterCSV.parse(Iconv.iconv('UTF-8', 'UTF-16LE', csv).first[3..-1], :col_sep => "\t")
  end
end