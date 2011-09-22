# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-net-ldap}
  s.version = "0.0.4"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Francis Cianfrocca"]
  s.cert_chain = nil
  s.date = %q{2006-08-15}
  s.description = %q{Net::LDAP is an LDAP support library written in pure Ruby. It supports all LDAP client features, and a subset of server features as well.}
  s.email = %q{garbagecat10@gmail.com}
  s.files = ["tests/testem.rb"]
  s.homepage = %q{http://rubyforge.org/projects/net-ldap}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{net-ldap}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A pure Ruby LDAP client library.}
  s.test_files = ["tests/testem.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
