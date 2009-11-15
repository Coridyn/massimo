module Massimo
  class Resource
    attr_reader :site, :source_path, :body
    
    # Creates a new page associated with the given file path.
    def initialize(site, source_path)
      @site        = site
      @source_path = ::Pathname.new(source_path)
      # read and parse the source file
      self.read_source!
    end
    
    # Renders the page using the registered filters.
    def render(locals = {})
      @body
    end
    
    # Gets the resource type, based on the file's extension
    def resource_type
      @source_path.extname.to_s[1..-1]
    end
    
    protected
    
      # Reads the source page file, and populates the meta_data and
      # body attributes.
      def read_source!
        raise Massimo::MissingResource unless @source_path.exist?
        # try to read it now
        begin
          @body = @source_path.read
        rescue
          raise Massimo::InvalidResource
        end
      end
  end
end
