RUBY_ENGINE == 'opal' ?
  (require 'notice-block/extension') :
  (require_relative 'notice-block/extension')

Extensions.register do
  block BoilerplateAdmonitionBlock
  block ReviewAdmonitionBlock
  block GuidanceAdmonitionBlock
  docinfo_processor BoilerplateAdmonitionBlockDocinfo
  docinfo_processor ReviewAdmonitionBlockDocinfo
  docinfo_processor GuidanceAdmonitionBlockDocinfo
end