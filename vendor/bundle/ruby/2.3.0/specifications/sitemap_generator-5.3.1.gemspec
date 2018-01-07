# -*- encoding: utf-8 -*-
# stub: sitemap_generator 5.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "sitemap_generator"
  s.version = "5.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Karl Varga"]
  s.date = "2017-02-27"
  s.description = "SitemapGenerator is a framework-agnostic XML Sitemap generator written in Ruby with automatic Rails integration.  It supports Video, News, Image, Mobile, PageMap and Alternate Links sitemap extensions and includes Rake tasks for managing your sitemaps, as well as many other great features."
  s.email = "kjvarga@gmail.com"
  s.homepage = "http://github.com/kjvarga/sitemap_generator"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Easily generate XML Sitemaps"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, ["~> 3.0"])
      s.add_development_dependency(%q<fog-aws>, ["~> 1.2"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>, ["~> 3.5"])
      s.add_development_dependency(%q<webmock>, ["~> 2.3"])
      s.add_development_dependency(%q<rake>, ["~> 12"])
    else
      s.add_dependency(%q<builder>, ["~> 3.0"])
      s.add_dependency(%q<fog-aws>, ["~> 1.2"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_dependency(%q<rspec>, ["~> 3.5"])
      s.add_dependency(%q<webmock>, ["~> 2.3"])
      s.add_dependency(%q<rake>, ["~> 12"])
    end
  else
    s.add_dependency(%q<builder>, ["~> 3.0"])
    s.add_dependency(%q<fog-aws>, ["~> 1.2"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6"])
    s.add_dependency(%q<rspec>, ["~> 3.5"])
    s.add_dependency(%q<webmock>, ["~> 2.3"])
    s.add_dependency(%q<rake>, ["~> 12"])
  end
end
