module Massimo
  class Javascript < Massimo::Resource
    def render
      compress(compile)
    end
    
    def extension
      @extension ||= '.js'
    end
    
    protected
    
      def compile
        case source_path.extname
        when '.coffee'
          require 'coffee-script' unless defined?(CoffeeScript)
          CoffeeScript.compile(content, Massimo.config.options_for(:coffee_script))
        else
          require 'sprockets' unless defined?(Sprockets)
          options = Massimo.config.options_for(:sprockets).merge(
            :assert_root  => Massimo.config.output_path,
            :source_files => [ source_path.to_s ]
          )
          secretary = Sprockets::Secretary.new(options)
          secretary.install_assets
          secretary.concatenation.to_s
        end
      end
  
      def compress(javascript)
        case Massimo.config.javascripts_compressor.to_s
        when 'min', 'jsmin'
          require 'jsmin' unless defined?(JSMin)
          JSMin.minify(javascript).strip
        when 'pack', 'packr'
          require 'packr' unless defined?(Packr)
          options = { :shrink_vars => true }.merge Massimo.config.options_for(:packr)
          Packr.pack(javascript, options)
        when 'yui', 'yui-compressor', 'yui/compressor'
          require 'yui/compressor' unless defined?(YUI)
          options = { :munge => true }.merge Massimo.config.options_for(:yui)
          YUI::JavaScriptCompressor.new(options).compress(javascript).strip
        when 'closure', 'closure-compiler', 'closure/compiler'
          require 'closure-compiler' unless defined?(Closure)
          options = Massimo.config.options_for(:closure)
          Closure::Compiler.new(options).compile(javascript).strip
        else
          javascript
        end
      end
  end
end