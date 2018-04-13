class AddUserToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :user, foreign_key: true, index: true
  end
end
