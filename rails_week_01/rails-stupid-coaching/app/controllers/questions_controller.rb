class QuestionsController < ApplicationController
  def ask
  end

  def answer
    if params[:question]
      @question = params[:question]
    end
  end
end
