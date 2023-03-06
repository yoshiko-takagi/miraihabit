class AddColumnImageToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :image, :string
  end
end
