require 'rubygems'
require 'yui/compressor'

require_relative '../lib/jscat'

describe JsCat do

  before :all do

  end

  it 'should concatenate javascript without catching fire' do
    javascript = JsCat.new({
      :js_dir => 'scripts',             #read javascript files from this directory
      :compress => 'true',              #uses/requires yui/compressor
      :prioritize => ['framework.js'],  #puts framework.js at the top of the file
      :ignore => ["script_c.js"],       #dont include these files 
      :output => "output/javascript.js" #write the file here
    })
  end


end