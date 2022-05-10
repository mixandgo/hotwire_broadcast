class AddOnlineFlagToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :online, :boolean, default: false, null: false
  end
end
