class AddFollowedIdToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :follwed_id, :integer
  end
end
