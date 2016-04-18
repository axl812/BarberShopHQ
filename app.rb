#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

# команды rake
# rake db:create_migration NAME=name_of_migration - создаёт новую миграцию в db/migrate/
# rake db:migrate - применяет (выполняет) созданную миграцию
# rake db:rollback - возврат к предыдущей миграции

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end
