$LOAD_PATH.push File.expand_path('../lib', __FILE__)

#TODO version = File.read("VERSION").strip
  
Gem::Specification.new do |s|
  s.name = "datashift"
  s.version = "0.16.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  
  s.authors = ["Thomas Statter"]

  s.description = "Comprehensive import/export tools between Excel/CSV & ActiveRecord Databases, Rails apps, and any Ruby project."
  s.email = "rubygems@autotelik.co.uk"
  
  s.test_files = Dir['spec/**/*']
  
  s.files =   s.files = Dir['{lib}/**/*', 'spec/factories/**/*', 'tasks/*', 'LICENSE.txt', "VERSION", "datashift.gemspec",	'Rakefile', "README.rdoc", 'README.markdown', 'datashift.thor']

  s.homepage = "http://github.com/autotelik/datashift"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]

  s.summary = "Shift data betwen Excel/CSV and any Ruby app"

  s.add_dependency 'spreadsheet'
  s.add_dependency 'rubyzip'


end

