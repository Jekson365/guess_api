module Questions
  class QuestionsController < ApplicationController
    def create
      question = Questions::Question.create(question_params)
      if question.save
        render json: question
      end
    end

    def index
      questions = Questions::Question.all
      render json: QuestionsBlueprint.render(questions, view: :normal)
    end

    def show
      question = Questions::Question.find_by(position: params[:id])
      next_question = Questions::Question.find_by(position: params[:id].to_i + 1)

      if question
        render json: {
          question: QuestionsBlueprint.render_as_hash(question, view: :normal),
          is_last: next_question.nil?
        }
      else
        render json: { message: 'No more data' }, status: :not_found
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end


    private

    def question_params
      params.require(:question).permit(:question, answers_attributes: [:answer, :is_true, :image])
    end
  end
end