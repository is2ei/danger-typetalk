
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "typetalk/gem_version"

Gem::Specification.new do |spec|
  spec.name          = "danger-typetalk"
  spec.version       = Typetalk::VERSION
  spec.authors       = ["Issei Horie"]
  spec.email         = ["is2ei.horie@gmail.com"]

  spec.summary       = 'Danger plugin to send notification to Typetalk.'
  spec.description   = 'Danger plugin to send notification to Typetalk.'
  spec.homepage      = 'https://github.com/is2ei/danger-typetalk'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'danger'
end
