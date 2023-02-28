class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.integer :difficulty
      t.string :name
      t.string :description
      t.integer :score
      t.integer :duration
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
