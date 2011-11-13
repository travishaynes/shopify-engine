$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "shopify-engine"
  s.version     = "0.0.1"
  s.authors     = ["Travis Haynes"]
  s.email       = ["travis.j.haynes@gmail.com"]
  s.homepage    = ""
  s.summary     = "A Rails 3.1 engine for Shopify apps."
  s.description = %q{shopify-engine is a Rails 3.1 engine that gets all the
Shopify API code out of the way so you can focus on what's more important:
Writing your app! It replaces shopify_app, and includes shopify_api, so it's the
only gem you will need to include in your Gemfile.}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "shopify_api", "~> 2.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda", ">= 3.0.0.beta2"
  s.add_development_dependency "spork", ">= 0.9.0.rc9"
  s.add_development_dependency "shopify-mock"
end
