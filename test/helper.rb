require "rubygems"
require "test/unit"
require "redgreen"
require "shoulda"
require "assertions"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require "massimo"

class Test::Unit::TestCase
  include Assertions

  #
  def source_dir(*subdirs)
    File.join(File.dirname(__FILE__), "source", *subdirs)
  end

  #
  def output_dir(*subdirs)
    File.join(File.dirname(__FILE__), "output", *subdirs)
  end

  #
  def clear_output
    FileUtils.rm_rf(output_dir)
  end
  
  #
  def site(options = {})
    @site ||= Massimo::Site.new({
      :source => source_dir,
      :output => output_dir
    }.merge(options))
  end
  
  #
  def page(*path)
    @page ||= Massimo::Page.new(site, source_dir("pages", *path))
  end
  
  #
  def view(*path)
    return @view if defined?(@view)
    meta_data = path.extract_options!
    @view = Massimo::View.new(site, source_dir("views", *path), meta_data)
  end
end
