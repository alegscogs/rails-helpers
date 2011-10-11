Gem::Specification.new do |s|
  s.name    = "alegscogs_helpers"
  s.version = 0.1
  s.authors = ["Alex Cox"]
  s.email   = ["alegscogs@gmail.com"]
  s.homepage = "http://github.com/alegscogs/rails-helpers"
  s.summary = "Some useful views helpers for rails3 apps"
  s.description = "includes a helper method to generate phrases from dynamic content"
  s.require_path = 'lib'
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.markdown)
end
