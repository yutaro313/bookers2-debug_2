class AddColummToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :followed_id, :integer
  end
end
