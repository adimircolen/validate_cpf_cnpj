# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "validate_cpf_cnpj"
  s.summary = "Insert ValidateCpfCnpj summary."
  s.description = "Insert ValidateCpfCnpj description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
end