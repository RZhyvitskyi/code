class QuestionsController < ApplicationController
  ANSWERS = ["No time for answers", "I don't really know", "Ask Siri instead", "Google knows that"]

  def ask
  end

  def answer
    @question = params[:question].downcase

    case @question
    when "hello"
      @answer = "I don't care, get dressed and go to work!"
    when /time/
      @answer = Time.now
    else
      @answer = ANSWERS.sample
    end
  end
end
