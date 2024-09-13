module Questions
  class Answer < ApplicationRecord
    mount_uploader :image,AnswerUploader
    belongs_to :question, :class_name => 'Questions::Question'
  end
end