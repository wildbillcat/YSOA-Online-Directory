# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{delayed_paperclip}
  s.version = "0.6.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jesse Storimer"]
  s.date = %q{2010-03-13}
  s.description = %q{Process your Paperclip attachments in the background with delayed_job.}
  s.email = %q{jesse@jstorimer.com}
  s.files = ["test/delayed_paperclip_test.rb", "test/resque_paperclip_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/jstorimer/delayed_paperclip}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Process your Paperclip attachments in the background with delayed_job.}
  s.test_files = ["test/delayed_paperclip_test.rb", "test/resque_paperclip_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.0"])
    else
      s.add_dependency(%q<paperclip>, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 2.3.0"])
  end
end
