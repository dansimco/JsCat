require File.join(File.dirname(__FILE__), '../src/JsCat')

javascript = JsCat.new({
  :js_dir => 'scripts',
  # :compress => 'true', uses/requires yui/compressor
  :prioritize => ['framework.js'],
  :output => "output/javascript.js"
})
puts javascript.js