class RemoveFollowerFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :follower, :integer
    remove_column :relationships, :follwed_id, :integer
  end
end
