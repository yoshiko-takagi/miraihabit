class ChangeDatatypeDescriptionwhatOfChallenges < ActiveRecord::Migration[7.0]
  def change
    change_column :challenges, :description_what, :text
  end
end
