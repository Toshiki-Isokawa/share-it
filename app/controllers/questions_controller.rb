class QuestionsController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def show
        @questions = current_user.questions.order(id: :desc).page(params[:page])
    end
    
    def new
        @question = current_user.questions.build  # form_with 用
    end
    
    def create
        @question = current_user.questions.build(question_params)
        if @question.save
            flash[:success] = '質問を投稿しました。'
            redirect_to root_url
        else
            @questions = current_user.questions.order(id: :desc).page(params[:page])
            flash.now[:danger] = '質問の投稿に失敗しました。'
             render 'toppages/index'
        end
    end
    
    def edit
    end
    
    def update
        if @question.update(question_params)
            flash[:success] = '正常に更新されました'
            redirect_to @question
        else
            flash.now[:danger] = '質問 は更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @question.destroy
        flash[:success] = '質問を削除しました。'
        redirect_back(fallback_location: root_path)
    end
    
    private
    
    def question_params
        params.require(:question).permit(:title, :content)
    end
    
    def correct_user
        @question = current_user.questions.find_by(id: params[:id])
        unless @question
            redirect_to root_url
        end
    end
end
