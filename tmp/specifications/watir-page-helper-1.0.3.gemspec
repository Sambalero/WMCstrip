# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "watir-page-helper"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alister Scott", "Mark Ryall"]
  s.date = "2012-09-20"
  s.description = "DEPRECATED - This is a page helper for Watir-WebDriver that allows use easy access to elements. See watirwebdriver.com"
  s.email = ["alister.scott@gmail.com"]
  s.licenses = ["MIT"]
  s.post_install_message = "\n    (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)\n\n    Watir-page-helper has now been END-OF_LIFED.\n    You should now use the page-object gem.\n    Please see this blog post for further details: http://wp.me/p98zF-k0\n\n    (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)\n\n"
  s.require_paths = ["lib"]
  s.rubyforge_project = "watir-page-helper"
  s.rubygems_version = "1.8.25"
  s.summary = "DEPRECATED - A page helper for Watir-WebDriver that allows use easy access to elements."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<watir-webdriver>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<watir-webdriver>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<watir-webdriver>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
