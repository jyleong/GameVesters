class QuestionsController < ApplicationController
	
def display_question
    #@question = Question.all

    @question = Question.find(params[:id])
   
  end
def answer_question
redirect_to new_question_path
end



def create
	 @question = Question.new(question_params)
  	@question.save
  	redirect_to @question
	 #render plain: params[:question].inspect
end

def new
end
def show
    @question = Question.find(params[:id])
  end
 def edit
    @question = Question.find(params[:id])
  end


 def index
    @question = Question.all
  end


private
  def question_params
    params.require(:question).permit(:qid, :content, :reward, :ans1, :ans2, :ans3, :ans4, :answer)
  end










end

