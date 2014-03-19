require 'csv'
require 'iconv'

class OfficeCSV
  BOM = [0xff, 0xfe].pack('C*').force_encoding('UTF-16LE')

  # Works just like CSV.generate. It adds a byte order mark to the beginning of the document and
  # converts the contents from UTF-8 to UTF-16LE.
  def self.generate(&block)
    BOM + Iconv.iconv('UTF-16LE', 'UTF-8',
      CSV.generate(:col_sep => "\t", &block)
    ).join
  end
  
  # Just like CSV.parse. It removes the byte order mark and transcodes from UTF-16LE to UTF-8.
  def self.parse(csv)
    CSV.parse(Iconv.iconv('UTF-8', 'UTF-16LE', csv).first[1..-1], :col_sep => "\t")
  end
end
