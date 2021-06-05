class RemoveFllowedIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :fllowed_id, :integer
  end
end
