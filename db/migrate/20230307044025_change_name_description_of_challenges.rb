class ChangeNameDescriptionOfChallenges < ActiveRecord::Migration[7.0]
  def change
    rename_column :challenges, :description, :description_what
  end
end
