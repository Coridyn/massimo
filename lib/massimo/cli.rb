require 'thor'

module Massimo
  class CLI < Thor
    include Thor::Actions
    
    source_root  File.expand_path('../templates', __FILE__)
    
    default_task :help
    
    class_option 'environment', :desc => 'Sets the environment',                 :aliases => '-e'
    class_option 'production',  :desc => "Sets the environment to 'production'", :aliases => '-p', :type => :boolean
    
    desc 'build', 'Builds the site from the source files'
    def build
      Kernel.exit Massimo::UI.report_errors {
        site.process
        Massimo::UI.say 'massimo has built your site', :growl => true
      }
    end
    map 'b' => :build
    
    desc 'generate SITE_NAME', 'Generates a new site with the give name'
    def generate(site_name)
      directory 'site', site_name
    end
    map 'g' => :generate
    
    desc 'server [PORT]', 'Runs a local Rack based web server on the given port'
    def server(port = 3000)
      Massimo::Server.start(site, port.to_i)
    end
    map 's' => :server
    
    desc 'watch', 'Watches your files for changes and automatically builds the site'
    def watch
      Massimo::Watcher.start(site)
    end
    map 'w' => :watch
    
    desc 'version', 'Prints out the version'
    def version
      puts Massimo::VERSION
    end
    map %w(v -v --version) => :version
    
    protected
      
      def site
        Massimo.site || Massimo::Site.new(:environment => environment)
      end
      
      def environment
        options[:production] == true  ? 'production' : options[:environment]
      end
  end
end
