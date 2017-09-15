class FavUser < ActiveRecord::Migration[5.1]
  def change
    change_table :favorites do |t|
      t.references :user
    end
  end
end
