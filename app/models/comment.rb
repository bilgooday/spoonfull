class Comment < ApplicationRecord
  default_scope { order('updated_at DESC') }
  belongs_to :recipe
  belongs_to :user
end
