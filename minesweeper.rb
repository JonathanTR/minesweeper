require 'debugger'
require './board'
require './cell'
require 'rubygems'
require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

get '/' do
  "Welcome to MineSweeper!"
end

get '/new' do
  cross_origin
  content_type 'application/json'
  @board = Board.new(10, 10, 20)
  JSON.generate(@board.grid)
end