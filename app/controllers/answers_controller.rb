class AnswersController < ApplicationController
    before_action :require_user_logged_in
    
    def create
        @question = Question.find(params[:question_id])
        @answer = current_user.answers.build(answer_params)
        @answer.question_id = @question.id
        
        if @answer.save
            flash[:success] = '回答を投稿しました。'
            redirect_to question_path(@question)
        else
            flash[:danger] = '回答の投稿に失敗しました。'
            redirect_to question_path(@question)
        end
    end
    
    def destroy
        @answer = current_user.answers.find_by(id: params[:id])
        unless @answer
            redirect_to root_url
        end
        @answer.destroy
        flash[:success] = '回答を削除しました。'
        redirect_back(fallback_location: root_path)
    end
    
    private 
    
    def answer_params
        params.require(:answer).permit(:content)
    end
    
end
