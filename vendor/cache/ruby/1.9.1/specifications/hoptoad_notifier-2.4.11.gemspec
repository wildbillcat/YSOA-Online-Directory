# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hoptoad_notifier}
  s.version = "2.4.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["thoughtbot, inc"]
  s.date = %q{2011-05-26}
  s.email = %q{support@hoptoadapp.com}
  s.files = ["test/backtrace_test.rb", "test/catcher_test.rb", "test/configuration_test.rb", "test/hoptoad_tasks_test.rb", "test/javascript_notifier_test.rb", "test/logger_test.rb", "test/notice_test.rb", "test/notifier_test.rb", "test/rack_test.rb", "test/rails_initializer_test.rb", "test/recursion_test.rb", "test/sender_test.rb", "test/user_informer_test.rb"]
  s.homepage = %q{http://www.hoptoadapp.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Send your application errors to our hosted service and reclaim your inbox.}
  s.test_files = ["test/backtrace_test.rb", "test/catcher_test.rb", "test/configuration_test.rb", "test/hoptoad_tasks_test.rb", "test/javascript_notifier_test.rb", "test/logger_test.rb", "test/notice_test.rb", "test/notifier_test.rb", "test/rack_test.rb", "test/rails_initializer_test.rb", "test/recursion_test.rb", "test/sender_test.rb", "test/user_informer_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<actionpack>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<actionpack>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<actionpack>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end
