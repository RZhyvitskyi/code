class QuestionsController < ApplicationController
  ANSWERS = ["No time for answers", "I don't really know", "Ask Siri instead", "Google knows that"]

  def ask
  end

  def answer
    if params[:question]
      @question = params[:question]
    else
      return
    end



    @answer = ANSWERS.sample
  end
end
