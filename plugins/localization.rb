require 'rubygems'
require 'i18n'

module Jekyll
  class LocalizationTag < Liquid::Tag

    def initialize(tag_name, key, tokens)
      super
      @key = key.to_s.strip
    end

    def render(context)
      I18n.load_path = Dir[File.join(context.registers[:site].source, 'locales', '*.{rb,yml}').to_s]
      I18n.locale = context.registers[:site].config['locale'] || 'en'
      "#{I18n.t(@key)}"
    end
  end
end

Liquid::Template.register_tag('l', Jekyll::LocalizationTag)

