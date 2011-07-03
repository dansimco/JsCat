#JsCat

JsCat is a ruby handler to load, concatenate and compress a directory of javascript files with the option to prioritize the load order of scripts (which is necessary for some js frameworks)

##Usage

require File.join(File.dirname(__FILE__), '../src/JsCat')

javascript = JsCat.new({
  :js_dir => 'scripts',
  :compress => 'true', #uses & requires "yui/compressor"
  :prioritize => ['framework.js']
})
puts javascript.js