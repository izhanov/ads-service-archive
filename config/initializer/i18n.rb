I18n.load_path += Dir[Application.root.concat('config/locales/**/*.yml')]
I18n.available_locales = %i[en ru]
I18n.default_locale = :ru if ENV["RACK_ENV"] == "development"
I18n.default_locale = :en if ENV["RACK_ENV"] == "test"
