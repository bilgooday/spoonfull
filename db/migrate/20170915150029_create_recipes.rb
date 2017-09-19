class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :img_url
      t.timestamps
      t.text :f2f_id 
    end
  end
end
