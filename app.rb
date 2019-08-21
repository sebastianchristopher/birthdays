require 'sinatra/base'
require_relative 'lib/birthday_list'


class BirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/birthday' do
    redirect '/' if params[:name].empty? || params[:birthday].empty?
    @birthday = Birthday.new(params[:name], Date.parse(params[:birthday]))
    erb(:birthdays)
  end

  run! if app_file == $0
end
