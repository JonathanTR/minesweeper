require 'debugger'
require './board'
require './cell'
require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  "Welcome to MineSweeper!"
end

get '/new' do
  @board = Board.new(10, 10, 20)
  JSON.generate(grid: @board.grid)
end