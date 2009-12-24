# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{massimo}
  s.version = "0.3.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Browne"]
  s.date = %q{2009-12-24}
  s.default_executable = %q{massimo}
  s.description = %q{Massimo builds HTML, Javascript, and CSS Files from your source.}
  s.email = %q{peter@peterbrowne.net}
  s.executables = ["massimo"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "bin/massimo",
     "lib/massimo.rb",
     "lib/massimo/command.rb",
     "lib/massimo/helpers.rb",
     "lib/massimo/javascript.rb",
     "lib/massimo/page.rb",
     "lib/massimo/resource.rb",
     "lib/massimo/site.rb",
     "lib/massimo/stylesheet.rb",
     "lib/massimo/templates.rb",
     "lib/massimo/view.rb",
     "massimo.gemspec",
     "test/assertions.rb",
     "test/helper.rb",
     "test/source/config.yml",
     "test/source/helpers/test_helper.rb",
     "test/source/javascripts/_plugin.js",
     "test/source/javascripts/application.js",
     "test/source/javascripts/lib.js",
     "test/source/lib/site.rb",
     "test/source/pages/_skipped_page.haml",
     "test/source/pages/about_us.erb",
     "test/source/pages/erb.erb",
     "test/source/pages/erb_with_layout.erb",
     "test/source/pages/feed.haml",
     "test/source/pages/haml.haml",
     "test/source/pages/html.html",
     "test/source/pages/index.erb",
     "test/source/pages/markdown.markdown",
     "test/source/pages/posts/first-post.haml",
     "test/source/pages/with_extension.haml",
     "test/source/pages/with_meta_data.haml",
     "test/source/pages/with_title.haml",
     "test/source/pages/with_url.haml",
     "test/source/pages/without_extension.haml",
     "test/source/pages/without_meta_data.haml",
     "test/source/pages/without_title.haml",
     "test/source/pages/without_url.haml",
     "test/source/stylesheets/_base.sass",
     "test/source/stylesheets/application.sass",
     "test/source/stylesheets/basic.css",
     "test/source/stylesheets/less_file.less",
     "test/source/views/layouts/application.haml",
     "test/source/views/with_helper.haml",
     "test/source/views/with_locals.haml",
     "test/source/views/without_locals.haml",
     "test/test_javascript.rb",
     "test/test_page.rb",
     "test/test_resource.rb",
     "test/test_site.rb",
     "test/test_stylesheet.rb",
     "test/test_view.rb"
  ]
  s.homepage = %q{http://github.com/peterbrowne/massimo}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Massimo is a static website builder.}
  s.test_files = [
    "test/assertions.rb",
     "test/helper.rb",
     "test/source/helpers/test_helper.rb",
     "test/source/lib/site.rb",
     "test/test_javascript.rb",
     "test/test_page.rb",
     "test/test_resource.rb",
     "test/test_site.rb",
     "test/test_stylesheet.rb",
     "test/test_view.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_development_dependency(%q<yard>, [">= 0.5.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_runtime_dependency(%q<sinatra_more>, [">= 0.3.26"])
      s.add_runtime_dependency(%q<directory_watcher>, [">= 1.3.1"])
      s.add_runtime_dependency(%q<sprockets>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<jsmin>, [">= 1.0.1"])
    else
      s.add_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_dependency(%q<yard>, [">= 0.5.2"])
      s.add_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_dependency(%q<sinatra_more>, [">= 0.3.26"])
      s.add_dependency(%q<directory_watcher>, [">= 1.3.1"])
      s.add_dependency(%q<sprockets>, [">= 1.0.2"])
      s.add_dependency(%q<jsmin>, [">= 1.0.1"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 2.10.2"])
    s.add_dependency(%q<yard>, [">= 0.5.2"])
    s.add_dependency(%q<activesupport>, [">= 2.3.5"])
    s.add_dependency(%q<sinatra_more>, [">= 0.3.26"])
    s.add_dependency(%q<directory_watcher>, [">= 1.3.1"])
    s.add_dependency(%q<sprockets>, [">= 1.0.2"])
    s.add_dependency(%q<jsmin>, [">= 1.0.1"])
  end
end

