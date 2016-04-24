#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pony'

set :database, "sqlite3:barbershop.db"

# команды rake
# rake db:create_migration NAME=name_of_migration - создаёт новую миграцию в db/migrate/
# rake db:migrate - применяет (выполняет) созданную миграцию
# rake db:rollback - возврат к предыдущей миграции

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.order 'created_at desc'
end

get '/' do
	erb "<h2>Hi, is BarberShopHQ! <br />
			 Go to tabs site.</h2>"
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:name]
	@phone = params[:phone]
	@datetime = params[:datestamp]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color
	c.save

	erb "<h2>Спасибо #{@username}, вы записались!</h2>"
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@mail = params[:mail]
	@message = params[:message]

	c = Contact.new
	c.mail = @mail
	c.message = @message
	c.save

	erb "<h2>Спасибо за обращение, мы ответим Вам на: #{@mail}</h2>"
end