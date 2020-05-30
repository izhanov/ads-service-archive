I18n.load_path += Dir[Application.root.concat('/locales/**/*.yml')]
I18n.available_locales = %i[en ru]
I18n.default_locale = :ru
