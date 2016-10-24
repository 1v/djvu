# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'djvu/version'

Gem::Specification.new do |spec|
  spec.name          = "djvu"
  spec.version       = Djvu::VERSION
  spec.authors       = ["1v"]
  spec.email         = ["forwardin+75785742@yandex.ru"]

  spec.summary       = %q{Ruby interface for DjVuLibre tools.}
  spec.description   = %q{Ruby interface for DjVuLibre tools.}
  spec.homepage      = "https://github.com/1v/djvu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|tmp)/}) \
    || f.match(%r{^(\.rubocop\.yml
                    |\.codeclimate\.yml
                    |\.gitignore
                    |\.rspec
                    |\.travis\.yml)$}x)
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "codeclimate-test-reporter"
    # codeclimate fix for ruby 1.9.3
  spec.add_development_dependency "json", "~> 1.8", "< 2" if RUBY_VERSION < "2"
end
