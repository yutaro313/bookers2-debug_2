class AddFollowedToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :follwed, :integer
  end
end
