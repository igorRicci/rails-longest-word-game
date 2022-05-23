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
    if within? && valid?
      @result = "Congratulations, #{params[:word]} is a valid word"
  end

  def within?
    c = 0
    @word = params[:word]
    arr = @word.split("")
    @letters.split("").each do |letter1|
      arr.each do |letter2|
        if letter1 == letter2
          c += 1
        end
      end
    end
    if c == arr.size
      true
    end
    false
  end
  end
end
