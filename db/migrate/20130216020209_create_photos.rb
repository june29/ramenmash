class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name,        :null => false
      t.string :url,         :null => false
      t.string :link_url,    :null => false
      t.string :original_id, :null => false

      t.timestamps
    end

    add_index :photos, :original_id, :unique => true
  end
end
