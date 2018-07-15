class AddOdorToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :odor, :string
  end
end
