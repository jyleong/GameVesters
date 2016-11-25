class QuestionsController < ApplicationController
	
def display_question
    #@question = Question.all
    #@question = Question.where('RANDOM() >= 0.9').take
    @question = Question.order("RANDOM()").first
    #@question = Question.find(params[:id])
   @user = current_user
  end
def answer_question
#render plain: params[:reward].inspect
if (params[:useranswer]==params[:answer])

@user = current_user
@user.add_currency(params[:reward].to_d)
redirect_to confirmation_path

#render plain: @user.currency
#redirect_to questions_path
else
 
  redirect_to incorrect_path(params[:answer])
end


#redirect_to confirmation_path(params[:id])
end
def create
	 @question = Question.new(question_params)
  	@question.save
  	redirect_to @question
	 #render plain: params[:question].inspect
end

def confirmation
  end

def incorrect
 @correct_answer=params[:answer]

end 

def new
end
def show
    @question = Question.find(params[:id])
  end
 def edit
    @question = Question.find(params[:id])
  end
def update
  @question = Question.find(params[:id])
 
  if @question.update(question_params)
    redirect_to @question
  else
    render 'edit'
  end
end
def destroy
  @question = Question.find(params[:id])
  @question.destroy
 
  redirect_to questions_path
end

 def index
    #@question = Question.limit(5).order("RANDOM()")
    @question = Question.all
  end
private
  def question_params
    params.require(:question).permit(:qid, :content, :reward, :ans1, :ans2, :ans3, :ans4, :answer)
  end
end

