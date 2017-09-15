class RecipeUser < ActiveRecord::Migration[5.1]
  def change
    change_table :recipes do |t|
      t.references :user
    end
  end
end
