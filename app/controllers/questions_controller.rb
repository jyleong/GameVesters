class QuestionsController < ApplicationController
def display_question
    @question = Question.all
   
  end


end
