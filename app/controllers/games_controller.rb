require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end
  
  def score
    attempt = params[:answer]

  end

  def real_word?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    read_url = open(url).read
    word = JSON.parse(read_url)
    word["found"]
  end

  def included?(attempt)
    attempt.chars.all? { |char| @letters.count(char) >= attempt.count(char) }
  end
end
