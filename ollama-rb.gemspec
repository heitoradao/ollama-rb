# frozen_string_literal: true

require_relative "lib/ollama-rb/version"

Gem::Specification.new do |spec|
  spec.name = "ollama.rb"
  spec.version = Ollama::VERSION
  spec.authors = ["HeitorJr"]
  spec.email = ["heitor.adao@gmail.com"]

  spec.summary = "ollama.rb is a CLI for local LLM's."
  spec.description = "A command line interface to interact with ollama AI agentic interface."
  spec.homepage = "https://github.com/heitoradao/ollama.rb"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    files = `git ls-files -z`.split("\x0")
    files.reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "json" #, "~> 1.0"
  spec.add_dependency "net-http"
  spec.add_dependency "uri"
  # spec.add_development_dependency "coveralls"
  # spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec"
  # spec.add_development_dependency "rubocop"
  # spec.add_development_dependency "rubocop-rspec"
  # spec.add_development_dependency "simplecov"
  # spec.add_development_dependency "simplecov-lcov"


  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
