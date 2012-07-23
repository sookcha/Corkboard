class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :body
      t.references :board

      t.timestamps
    end
    add_index :posts, :board_id
  end
end
