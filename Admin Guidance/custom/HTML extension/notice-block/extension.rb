require 'asciidoctor/extensions'

include Asciidoctor

# An extension that introduces a custom admonition type, complete
# with a custom icon.
#
# Usage
#
#   [QUESTION]
#   ====
#   What's the main tool for selecting colors?
#   ====
#
# or
#
#   [QUESTION]
#   What's the main tool for selecting colors?
#
class BoilerplateAdmonitionBlock < Extensions::BlockProcessor
  use_dsl
  named :BOILERPLATE
  on_contexts :example, :paragraph

  def process parent, reader, attrs
    attrs['name'] = 'boilerplate'
    attrs['caption'] = 'Boilerplate'
    create_block parent, :admonition, reader.lines, attrs, content_model: :compound
  end
end

class ReviewAdmonitionBlock < Extensions::BlockProcessor
  use_dsl
  named :REVIEW
  on_contexts :example, :paragraph

  def process parent, reader, attrs
    attrs['name'] = 'review'
    attrs['caption'] = 'Review'
    create_block parent, :admonition, reader.lines, attrs, content_model: :compound
  end
end

class GuidanceAdmonitionBlock < Extensions::BlockProcessor
  use_dsl
  named :GUIDANCE
  on_contexts :example, :paragraph

  def process parent, reader, attrs
    attrs['name'] = 'guidance'
    attrs['caption'] = 'Guidance'
    create_block parent, :admonition, reader.lines, attrs, content_model: :compound
  end
end

class BoilerplateAdmonitionBlockDocinfo < Extensions::DocinfoProcessor
  use_dsl

  def process doc
    '<style>
.admonitionblock td.icon .icon-boilerplate:before {content:"\f023";color:#3F903E;}
</style>'
  end
end

class ReviewAdmonitionBlockDocinfo < Extensions::DocinfoProcessor
  use_dsl

  def process doc
    '<style>
.admonitionblock td.icon .icon-review:before {content:"\f0ea";color:#FDB109;}
</style>'
  end
end

class GuidanceAdmonitionBlockDocinfo < Extensions::DocinfoProcessor
  use_dsl

  def process doc
    '<style>
.admonitionblock td.icon .icon-guidance:before {content:"\f02d";color:#0909FD;}
</style>'
  end
end