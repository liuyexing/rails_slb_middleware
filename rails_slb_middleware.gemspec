
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_slb_middleware/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_slb_middleware"
  spec.version       = RailsSlbMiddleware::VERSION
  spec.authors       = ["xxy"]
  spec.email         = ["xxy@xiangyang.com"]

  spec.summary       = %q{阿里云SLB Rails middleware}
  spec.description   = %q{阿里云SLB Rails middleware, 提供强制rewrite https、Ping检查等能力}
  spec.homepage      = "https://github.com/xuxiangyang/rails_slb_middleware"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack', "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
