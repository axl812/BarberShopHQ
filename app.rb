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

class Barber < ActiveRecord::Base
end

class Client < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3} #функция с параметром1 и параметром2 (хэш):  http://guides.rubyonrails.org/active_record_validations.html
	validates :phone, presence: true 
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.order 'created_at' #desc'
end

get '/' do
	erb :index
end

get '/barber/:id' do
	erb :barber
end


get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	
	@c = Client.new params[:client]
	if @c.save # .save принимает значение false если пустой
		erb "<h2>Спасибо, вы записались!</h2>"
	else
		@error = @c.errors.full_messages.first # http://guides.rubyonrails.org/active_record_validations.html
		erb :visit
	end
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	c = Contact.new params[:contact]
	c.save # .save принимает значение false если пустой

	erb "<h2>Спасибо за обращение, мы ответим Вам на указанный Email.</h2>"
end