module Massimo
  class Watcher
    class << self
      def start(site)
        self.new(site).run
      end
    end
    
    def initialize(site)
      @site  = site
      @files = []
    end
    
    # Runs a loop, processing the Site whenever files have changed.
    def run
      loop do
        process
        sleep 0.5
      end
    end
    
    # Processes the Site if any of the files have changed.
    def process
      if changed?
        begin
          puts 'massimo has noticed a change'
          @site.process
          puts 'massimo has built your site'
        rescue Exception => e
          puts e.message
          puts e.backtrace
        end
      end
    end
    
    # Determine if any of the Site's files have changed.
    def changed?
      @files != files
    end
    
    protected
    
      def files
        @files = Dir[*glob].map { |file| File.mtime(file) }
      end
      
      def glob
        glob  = @site.resources.map(&:path)
        glob << @site.config.path_for(:lib)
        glob << @site.config.path_for(:helpers)
        glob.map! { |path| File.join(path, '**/*.*') }
        glob
      end
  end
end
