class AddColumnToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :description_why, :text
  end
end
