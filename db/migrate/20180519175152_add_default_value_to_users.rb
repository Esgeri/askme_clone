class AddDefaultValueToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :background_color, :string, default: "#3F717D"
  end
end
