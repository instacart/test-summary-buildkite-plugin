# frozen_string_literal: true

module TestSummaryBuildkitePlugin
  class HamlRender
    def self.render(name, params, folder: nil)
      filename = %W[#{ROOT_DIR}/templates/#{folder}/#{name}.html.haml #{ROOT_DIR}/templates/#{name}.html.haml].find { |f| File.exist?(f) }
      if filename
        template = Haml::Template.new(filename, escape_html: true)
        template.render(Object.new, params)
      end
    end
  end
end
