class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :fllower_id
      t.integer :fllowed_id

      t.timestamps
    end
  end
end
