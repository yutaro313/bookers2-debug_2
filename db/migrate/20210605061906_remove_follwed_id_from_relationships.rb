class RemoveFollwedIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :follwed, :integer
  end
end
