require 'sinatra/base'
require_relative 'lib/birthday_list'


class BirthdayApp < Sinatra::Base
  enable :sessions

  get '/' do
    @error = session[:error]
    erb(:index)
  end

  post '/birthday' do
    session[:error] = false
    begin
      @dob = Date.parse(params[:birthday])
    rescue ArgumentError
      @dob = nil
      session[:error] = true
    end
    redirect '/' if params[:name].empty? || @dob.nil?
    @birthday = Birthday.new(params[:name], Date.parse(params[:birthday]))
    erb(:birthdays)
  end

  run! if app_file == $0
end
