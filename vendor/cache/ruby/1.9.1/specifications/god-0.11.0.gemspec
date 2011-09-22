# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{god}
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Preston-Werner", "Kevin Clark", "Eric Lindvall"]
  s.date = %q{2010-07-01}
  s.default_executable = %q{god}
  s.description = %q{An easy to configure, easy to extend monitoring framework written in Ruby.}
  s.email = %q{god-rb@googlegroups.com}
  s.executables = ["god"]
  s.extensions = ["ext/god/extconf.rb"]
  s.files = ["test/test_behavior.rb", "test/test_campfire.rb", "test/test_condition.rb", "test/test_conditions_disk_usage.rb", "test/test_conditions_http_response_code.rb", "test/test_conditions_process_running.rb", "test/test_conditions_tries.rb", "test/test_contact.rb", "test/test_dependency_graph.rb", "test/test_driver.rb", "test/test_email.rb", "test/test_event_handler.rb", "test/test_god.rb", "test/test_handlers_kqueue_handler.rb", "test/test_jabber.rb", "test/test_logger.rb", "test/test_metric.rb", "test/test_process.rb", "test/test_prowl.rb", "test/test_registry.rb", "test/test_socket.rb", "test/test_sugar.rb", "test/test_system_portable_poller.rb", "test/test_system_process.rb", "test/test_task.rb", "test/test_timeline.rb", "test/test_trigger.rb", "test/test_watch.rb", "test/test_webhook.rb", "bin/god", "ext/god/extconf.rb"]
  s.homepage = %q{http://god.rubyforge.org/}
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{god}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Process monitoring framework.}
  s.test_files = ["test/test_behavior.rb", "test/test_campfire.rb", "test/test_condition.rb", "test/test_conditions_disk_usage.rb", "test/test_conditions_http_response_code.rb", "test/test_conditions_process_running.rb", "test/test_conditions_tries.rb", "test/test_contact.rb", "test/test_dependency_graph.rb", "test/test_driver.rb", "test/test_email.rb", "test/test_event_handler.rb", "test/test_god.rb", "test/test_handlers_kqueue_handler.rb", "test/test_jabber.rb", "test/test_logger.rb", "test/test_metric.rb", "test/test_process.rb", "test/test_prowl.rb", "test/test_registry.rb", "test/test_socket.rb", "test/test_sugar.rb", "test/test_system_portable_poller.rb", "test/test_system_process.rb", "test/test_task.rb", "test/test_timeline.rb", "test/test_trigger.rb", "test/test_watch.rb", "test/test_webhook.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<twitter>, [">= 0.3.7"])
      s.add_development_dependency(%q<prowly>, [">= 0.2.1"])
      s.add_development_dependency(%q<xmpp4r>, [">= 0.4.0"])
      s.add_development_dependency(%q<dike>, [">= 0.0.3"])
      s.add_development_dependency(%q<snapshot>, ["< 2.0.0", ">= 1.0.0"])
      s.add_development_dependency(%q<rcov>, [">= 0.9.8"])
      s.add_development_dependency(%q<daemons>, ["< 2.0.0", ">= 1.0.10"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.1"])
    else
      s.add_dependency(%q<twitter>, [">= 0.3.7"])
      s.add_dependency(%q<prowly>, [">= 0.2.1"])
      s.add_dependency(%q<xmpp4r>, [">= 0.4.0"])
      s.add_dependency(%q<dike>, [">= 0.0.3"])
      s.add_dependency(%q<snapshot>, ["< 2.0.0", ">= 1.0.0"])
      s.add_dependency(%q<rcov>, [">= 0.9.8"])
      s.add_dependency(%q<daemons>, ["< 2.0.0", ">= 1.0.10"])
      s.add_dependency(%q<mocha>, [">= 0.9.1"])
    end
  else
    s.add_dependency(%q<twitter>, [">= 0.3.7"])
    s.add_dependency(%q<prowly>, [">= 0.2.1"])
    s.add_dependency(%q<xmpp4r>, [">= 0.4.0"])
    s.add_dependency(%q<dike>, [">= 0.0.3"])
    s.add_dependency(%q<snapshot>, ["< 2.0.0", ">= 1.0.0"])
    s.add_dependency(%q<rcov>, [">= 0.9.8"])
    s.add_dependency(%q<daemons>, ["< 2.0.0", ">= 1.0.10"])
    s.add_dependency(%q<mocha>, [">= 0.9.1"])
  end
end
