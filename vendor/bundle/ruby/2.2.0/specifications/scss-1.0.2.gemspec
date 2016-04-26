# -*- encoding: utf-8 -*-
# stub: scss 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "scss"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Henrik Nyh"]
  s.date = "2015-02-22"
  s.email = ["henrik@nyh.se"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.post_install_message = "\nNOTE: The gem is called \"sass\", not \"scss\"! Get rid of the \"scss\" gem and try again.\n\n"
  s.rubygems_version = "2.4.5"
  s.summary = "Placeholder gem to tell you that you wanted \"sass\"."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
