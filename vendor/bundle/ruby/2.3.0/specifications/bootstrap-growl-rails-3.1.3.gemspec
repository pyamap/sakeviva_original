# -*- encoding: utf-8 -*-
# stub: bootstrap-growl-rails 3.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-growl-rails"
  s.version = "3.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dennis Baskin"]
  s.date = "2015-10-26"
  s.description = "This Gem is intended as an asset wrapper for bootstrap-growl: https://github.com/mouse0270/bootstrap-growl. It turns Bootstrap alerts into \"Growl-like\" notifications. "
  s.email = ["dennis@dennisbaskin.com"]
  s.homepage = "https://github.com/dennisbaskin/bootstrap-growl-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Asset wrapper for bootstrap-growl, a plugin that turns Bootstrap alerts into \"Growl-like\" notifications."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
