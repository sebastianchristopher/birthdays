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
    if date_format(params[:birthday]).nil?
      session[:error] = true
    end
    begin
      @dob = Date.parse(params[:birthday])
    rescue ArgumentError
      @dob = nil
      session[:error] = true
    end
    redirect '/' if params[:name].empty? || session[:error] == true
    session[:name] = params[:name]
    session[:date] = params[:birthday]
    redirect '/birthday'
  end

  get '/birthday' do
    @birthday = Birthday.new(session[:name], Date.parse(session[:date]))
    erb(:birthdays)
  end

  private

  def date_format(date_string)
    date_string =~ /\d{2}-\d{2}-\d{4}/ || date_string =~ /\d{4}-\d{2}-\d{2}/
  end

  run! if app_file == $0
end
