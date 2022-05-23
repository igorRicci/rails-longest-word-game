require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    # display a new random grid and a form
    @letters = ('a'..'z').to_a.shuffle[0..rand(6..9)].join
  end

  def valid?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    return word['found']
  end

  def score
    @result = valid?
    # receives submit from form
  end
end

#

def within?
  params[:word].to_a.each do |letter|
    letter
  end
end
