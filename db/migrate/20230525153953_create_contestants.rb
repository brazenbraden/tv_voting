class CreateContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :contestants do |t|
      t.string :name
      t.integer :votes, default: 0
      t.integer :uncounted, default: 0
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
