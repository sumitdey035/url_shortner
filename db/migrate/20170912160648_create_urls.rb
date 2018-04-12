class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.references :account, index: true
      t.text        :url, null: false
      t.string      :title
      t.text        :description
      t.string      :favicon_link
      t.string      :image_link
      t.timestamps   null: false
    end
  end
end
