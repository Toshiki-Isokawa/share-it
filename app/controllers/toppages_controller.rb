class ToppagesController < ApplicationController
  def index
    if logged_in?
      @question = current_user.questions.build  # form_with 用
      @questions = current_user.questions.order(id: :desc).page(params[:page])
    end
  end
end
