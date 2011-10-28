Gem::Specification.new do |s|
  s.name = "jscat"
  s.version = "1.0.0"
  s.authors = ["Daniel Sim"]
  s.date = %q{2011-10-28}
  s.description = 'Joins and compresses a directory of javascript files to a single file'
  s.summary = %Q{Grabs all the javascript files in a directory and smooshes them into a single file for caching & transfer. Optional YUI compression, file order prioritisation and ignore list (so you don't recursively add the output to itself)}
  s.email = 'dan@explodingbox.com'
  s.files = ['README.rdoc', 'lib/jscat.rb','spec/jscat_spec.rb']
  s.homepage = 'http://www.daniel-sim.com'
  s.has_rdoc = true
end