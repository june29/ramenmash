class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.references :winner, :null => false
      t.references :loser,  :null => false

      t.timestamps
    end

    add_index :judges, :winner_id
    add_index :judges, :loser_id
  end
end
