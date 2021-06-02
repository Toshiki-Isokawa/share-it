class ToppagesController < ApplicationController
  def index
    if logged_in?
      @questions = current_user.feed_questions.order(id: :desc).page(params[:page])
    end
    @question = Question.order(id: :desc).page(params[:page])
  end
end
