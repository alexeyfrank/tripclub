template_path = Rails.root.join('app/views/web/snippets')
Liquid::Template.file_system = Liquid::LocalFileSystem.new(template_path)
