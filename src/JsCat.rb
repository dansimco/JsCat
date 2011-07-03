class JsCat
  attr_reader :js
  def initialize(params = {})
    @js_dir   = params[:js_dir] || "public"
    @compress = params[:compress] || false
    @output   = params[:output] || false
    @priority_files = params[:prioritize] || false
    require "yui/compressor" if @compress
    render_js
    write_js if @output
  end
  def list_scripts
    @scripts = Dir.glob("#{@js_dir}/*.js")
    if @priority_files then    
      @priority_files_full = []
      @priority_files.uniq.each {|file|
        @priority_files_full << @js_dir+'/'+file
      }
      @priority_files_full.each {|file|
        if @scripts.include? file then
          @scripts.delete(file)
        else
          @priority_files_full.delete file  
        end
      }
      @scripts = @priority_files_full + @scripts
    end
    return @scripts
  end
  def set_scripts(scripts_array)
    @scripts = scripts_array
  end
  def render_js
    @js = ""
    list_scripts.each { |script|  
      File.open(script, 'r') do |f1|  
        while line = f1.gets  
          @js = @js + line
        end
        @js = @js + "\n"
      end   
     }
     compress_js if @compress
     return @js
  end
  def compress_js
     begin
       compressor = YUI::JavaScriptCompressor.new
       compressed_js = compressor.compress(@js)
       compress_success = true
       puts "compressed js"
     rescue Exception=>e
       puts 'Warning: Could not write javascript file, syntax error in javascript'
     end
     @js = compressed_js if compress_success
     return @js
  end
  def write_js
    File.open(@output,'w') { |f| 
      f.write(@js) 
    }
  end
end