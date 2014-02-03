# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'key_vault/version'

Gem::Specification.new do |spec|
  spec.name          = "key-vault"
  spec.version       = KeyVault::VERSION
  spec.authors       = ["redbubble"]
  spec.email         = ["developers@redbubble.com"]
  spec.description   = %q{Put all your secrets in the vault}
  spec.summary       = %q{KeyVault manages all your secrets so they don't have to live in the repo}
  spec.homepage      = "https://github.com/redbubble/key-vault"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec"
end
