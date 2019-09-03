require "sinatra"
require "sinatra/reloader" if development?
require "./game"

game = Game.new

get "/" do
  erb :form, { :locals => { :game_progress => game.progress } }
end

post "/" do
  game.play((Integer(params["number"]) rescue nil)) unless game.over?
  redirect "/"
end

get "/new" do
  game.new_game
  redirect "/"
end

get "/help" do
  erb :help
end
