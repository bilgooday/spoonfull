class CommentsUser < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.references :user
    end
  end
end
