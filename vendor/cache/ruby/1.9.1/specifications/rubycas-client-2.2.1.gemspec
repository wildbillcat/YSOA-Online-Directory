# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubycas-client}
  s.version = "2.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Zukowski", "Matt Walker"]
  s.date = %q{2010-06-24}
  s.description = %q{Client library for the Central Authentication Service (CAS) protocol.}
  s.email = %q{matt at roughest dot net}
  s.homepage = %q{http://rubycas-client.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rubycas-client}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Client library for the Central Authentication Service (CAS) protocol.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_development_dependency(%q<gemcutter>, [">= 0.2.1"])
      s.add_development_dependency(%q<hoe>, [">= 2.5.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_dependency(%q<gemcutter>, [">= 0.2.1"])
      s.add_dependency(%q<hoe>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
    s.add_dependency(%q<gemcutter>, [">= 0.2.1"])
    s.add_dependency(%q<hoe>, [">= 2.5.0"])
  end
end
