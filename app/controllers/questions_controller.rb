class QuestionsController < ApplicationController
  before_action :set_topic
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def new
    @question = @topic.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.topic = @topic

    respond_to do |format|
      if @question.save
        format.html { redirect_to topic_path(@topic), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @question.update(question_params)
  #       format.html { redirect_to topic_path(@topic), notice: 'Question was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @question }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to topic_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body, :topic_id)
    end
end
