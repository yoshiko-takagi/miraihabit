class AddMaxScoreToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :max_score, :integer, default: 0
    remove_column :challenges, :score, :integer
  end
end
