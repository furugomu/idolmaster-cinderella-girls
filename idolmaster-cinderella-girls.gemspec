# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idolmaster/cinderella_girls/version'

Gem::Specification.new do |spec|
  spec.name          = "idolmaster-cinderella-girls"
  spec.version       = Idolmaster::CinderellaGirls::VERSION
  spec.authors       = ["furugomu"]
  spec.email         = ["furugomu@gmail.com"]
  spec.summary       = %q{THE IDOLM@STER Cinderella Girls}
  spec.description   = %q{Idol data from THE IDOLM@STER Cinderella Girls}
  spec.homepage      = "https://github.com/furugomu/idolmaster-cinderella-girls/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5.0"
  spec.add_development_dependency "mechanize", "~> 2.7.0"
end
