class CreateCuriosities < ActiveRecord::Migration
  def change
    create_table :curiosities do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.string :image_text

      t.timestamps null: false
    end
  end
end
