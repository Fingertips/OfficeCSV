require 'rake'

Gem::Specification.new do |spec|
  spec.name = 'office_csv'
  spec.version = '0.2.0'
  
  spec.author = "Manfred Stienstra"
  spec.email = "manfred@fngtps.com"

  spec.description = <<-EOF
    Tiny wrapper around FasterCSV to create CSV which is read properly by Microsoft Office.
  EOF
  spec.summary = <<-EOF
    Tiny wrapper around FasterCSV to create CSV which is read properly by Microsoft Office.
  EOF

  spec.add_dependency('iconv')

  spec.files = FileList['LICENSE', 'lib/**/*.rb'].to_a

  spec.has_rdoc = true
  spec.extra_rdoc_files = ['LICENSE']
  spec.rdoc_options << "--charset=utf-8"
end
