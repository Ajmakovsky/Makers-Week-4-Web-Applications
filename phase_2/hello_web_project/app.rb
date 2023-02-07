require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
# This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # get '/names' do 

  #   name1 = params[:name1]
  #   name2 = params[:name2]
  #   name3 = params[:name3]


  #   return "#{name1}, #{name2}, #{name3}"
  # end

  get '/names' do 
    names = params[:names]
    return names
  end 

  post '/sort-names' do 

    names = params[:names]
    split_names = names.split(",")
    sorted_names = split_names.sort.join(",")

    return sorted_names
  end


 
end 

 




  # get '/hello' do 
  #   name = params[:name]
  #   return "Hello #{name}"
  # end 

  # post '/submit' do 
  #   name = params[:name]
  #   message = params[:message]
  #   return "Thanks #{name}, you sent this message: #{message}"
  # end 