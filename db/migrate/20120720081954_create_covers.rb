class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|

      t.timestamps
    end
  end
end
