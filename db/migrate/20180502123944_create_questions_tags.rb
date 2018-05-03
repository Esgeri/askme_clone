class CreateQuestionsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_tags, id: false do |t|
      t.references :question, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true
    end
  end
end
