require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'...'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    serialized_word = open(url).read
    word = JSON.parse(serialized_word)
    word['found']
    if word['found']
      @result = "Congratulations! #{answer.upcase} is a valid English word!"
    else
      @result = "Sorry but #{answer.upcase} does not seem to be an English word..."
    end
  end
end
