# frozen_string_literal: true

require_relative "lib/aparcamiento/version"

Gem::Specification.new do |spec|
  spec.name = "aparcamiento"
  spec.version = Aparcamiento::VERSION
  spec.authors = ["Eduardo José Barrios García"]
  spec.email = ["alu0101341019@ull.edu.es"]

  spec.summary = " Write a short summary, because RubyGems requires one."
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://github.com/ULL-ESIT-LPP-2223/gema-eduardo-barrios-alu0101341019"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TSet to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-2223/gema-eduardo-barrios-alu0101341019"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-2223/gema-eduardo-barrios-alu0101341019"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

spec.add_development_dependency "guard"
spec.add_development_dependency "guard-rspec"
spec.add_development_dependency "guard-bundler"
spec.add_development_dependency "rdoc"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
