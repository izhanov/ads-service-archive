# Ads Service


# Зависимости

- Ruby `2.7.0`
- Bundler `2.1.2`
- Sinatra `2.0.8`
- ActiveRecord `6.0.0+`
- Puma `4.3+`
- PostgreSQL `9.5+`
- dry-monads `1.3.5`
- dry-validation `1.5.0`

# Установка и запуск приложения

### 1. Установите зависимости и создайте базу данных:

```
bundle install

RACK_ENV=development rake db:create
RACK_ENV=test rake db:create

RACK_ENV=development rake db:migrate
RACK_ENV=test rake db:migrate
```

### 2. Запустите приложение:

```
bin/puma
```

# Запуск консоли приложения

```
bin/console
```

# Запуск тестов

```
rspec
```
