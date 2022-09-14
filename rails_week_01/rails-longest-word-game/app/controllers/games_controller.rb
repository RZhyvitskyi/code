class GamesController < ApplicationController
  def new
    @time = Time.now
    @letters = []
    number_of_letters = rand(5..10)

    number_of_letters.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')
    @time = params[:time]
    @time_result = Time.now - Time.parse(@time)

    p @valid_word = validate_word(@word)

    @result = valid_word?(@word, @letters)
  end

  private

  def valid_word?(attempt, grid)
    grid_hash = grid.tally
    answer_array = attempt.upcase.chars
    answer_hash = answer_array.tally
  
    answer_array.none? do |letter|
      if !grid_hash.key?(letter)
        true
      else
        answer_hash[letter] > grid_hash[letter]
      end
    end
  end

  def validate_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"

    JSON.parse(Faraday.get(url).body)
  end
end
