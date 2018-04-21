class AddIndexToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_index :questions, :questioning_user_id
  end
end
