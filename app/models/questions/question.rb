module Questions
  class Question < ApplicationRecord
    before_create :set_position_id

    has_many :answers, :class_name => 'Questions::Answer',dependent: :destroy
    accepts_nested_attributes_for :answers

    private
    def set_position_id
      maximum = Questions::Question.maximum(:position)
      if maximum
        self.position = maximum + 1
      else
        self.position = 1
      end
    end
  end
end