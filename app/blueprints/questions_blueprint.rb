class QuestionsBlueprint < Blueprinter::Base
  view :normal do
    fields :question,:position
    association :answers,blueprint: AnswersBlueprint
  end
end