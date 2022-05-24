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
    @answer = if within?
      if valid?
        "congratulations my firned"
      else
        "Not a valid word"
      end
    else
      "Sometings wrong"
    end
  end

  def within?
    @letters = params[:letters].split(//)
    array = params[:word].split(//)
    array.all? { |letter| @letters.count(letter) == array.count(letter) }
  end
end
