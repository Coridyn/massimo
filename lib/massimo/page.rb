require 'active_support/core_ext/hash/keys'
require 'active_support/inflector'
require 'yaml'

module Massimo
  class Page < Resource
    def render
      template = Tilt.new(source_path.basename.to_s, @line || 1) { content }
      output   = template.render(Massimo.site.template_scope, @meta_data)
      if found_layout = Massimo::View.find("layouts/#{layout}")
        output = found_layout.render(:page => self) { output }
      end
      output
    end
    
    def title
      @meta_data[:title] ||= source_path.basename.to_s.chomp(source_path.extname.to_s).titleize
    end
    
    def extension
      @meta_data[:extension] ||= '.html'
    end
    
    def url
      @meta_data[:url] ||= super
    end
    
    def layout
      @meta_data[:layout] = 'application' if @meta_data[:layout].nil?
      @meta_data[:layout]
    end
    
    protected
    
      def read_source
        @line        = nil
        @content     = ''
        front_matter = false
        meta_data    = ''
        
        source_path.open do |file|
          file.each do |line|
            if line =~ /\A---\s*\Z/
              front_matter = !front_matter
            else
              if front_matter
                meta_data << line
              else
                @line ||= file.lineno
                @content << line
              end
            end
          end
        end
        
        @meta_data = (YAML.load(meta_data) || {}).symbolize_keys
      end
      
      def method_missing(method, *args, &block)
        if args.length == 0
          read_source
          method_name = method.to_s
          if method_name.chomp! '?'
            !!@meta_data[method_name.to_sym]
          else
            @meta_data[method_name.to_sym]
          end
        else
          super
        end
      end
  end
end
