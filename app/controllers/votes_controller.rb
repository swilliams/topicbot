class VotesController < ApplicationController
  before_filter :authenticate!

  def vote
    @vote = Vote.create(user_id: current_user.id, question_id: params[:question_id])
    @question = Question.find(params[:question_id])

    if @vote
      if request.xhr?
        render json: {status: 201, question: @question}
      else
        redirect_to :back, notice: "You voted!"
      end
    else
      if request.xhr?
        render json: {status: 422, errors: @vote.errors.full_messages}
      else
        redirect_to :back, notice: "Sorry, there was a problem creating your vote."
      end
    end
  end

  def unvote
    if Vote.where(user_id: current_user.id, question_id: params[:question_id]).all.map(&:destroy)
      @question = Question.find(params[:question_id])
      if request.xhr?
        render json: {status: 200, question: @question}
      else
        redirect_to :back, notice: "Your vote was removed."
      end
    else
      if request.xhr?
        render json: {status: 422, errors: @question.errors.full_messages}
      else
        redirect_to :back, notice: "Sorry, there was a problem removing your vote."
      end
    end
  end
end
