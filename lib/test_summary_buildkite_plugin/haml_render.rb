# frozen_string_literal: true

module TestSummaryBuildkitePlugin
  class HamlRender
    def self.render(name, params, folder: nil)
      filename = [
          Files.join(ROOT_DIR, "templates", folder, "#{name}.html.haml"), 
          Files.join(ROOT_DIR, "templates", "#{name}.html.haml")
        ].find { |f| File.exist?(f) }
      if filename
        engine = Haml::Engine.new(File.read(filename), escape_html: true)
        engine.render(Object.new, params)
      else
        puts "Cannot find template with name #{name}, #{ROOT_DIR}/templates/#{folder}/#{name}.html.haml"
      end
    end
  end
end
