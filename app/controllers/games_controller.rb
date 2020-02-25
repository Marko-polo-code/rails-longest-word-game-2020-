class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:letter] # user input
    @letter_grid = params[:grid].split # letters available
    fetch("https://wagon-dictionary.herokuapp.com/#{word}")
    # if #is on the grid
    #   if # is an english word
    #     # calculate score
    #   end
    # end
    #else score is 0

    if on_grid?(@letter_grid, @word)
      @score = @word.length * 1
      @message = "Great, it is on the grid!"
      # check if is an english word
      # calculate the score
    else
      score = 0
      @message = "Boo, it is not on the grid!"
    end
    flash.keep[:score]
  end

  def on_grid?(grid, word)
    word.split("").all? { |letter| word.count(letter) <= grid.count(letter) }
  end
end
