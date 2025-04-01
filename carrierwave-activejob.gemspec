# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "backgrounder/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-activejob"
  s.version     = CarrierWave::Backgrounder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fabian Schwahn"]
  s.email       = ["fabian.schwahn@gmail.com"]
  s.homepage    = ""
  s.licenses    = ["MIT"]
  s.summary     = %q{Offload CarrierWave's image processing and storage to a background process using ActiveJob}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/denkungsart"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "carrierwave", ">= 2.0", "< 4"
  s.add_dependency "mime-types"

  s.add_development_dependency "rspec", ["~> 3.5.0"]
  s.add_development_dependency "rake"
end
