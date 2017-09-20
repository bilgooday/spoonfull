class Recipe < ApplicationRecord
  include HTTParty
  # validates :f2f_id, :uniqueness => true
  # check out figaro
  ENV["FOOD2FORK_KEY"] = '3be704f8bb71f8a1151a3a0c85e81b38'
  base_uri 'http://food2fork.com/api'
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json


  def self.for term
    response = get("/search", query: { q: term})["recipes"]
    recipe_data = response.map do |r|
      new_entry = Recipe.new
      new_entry.f2f_id = r['recipe_id']
      new_entry.title = r['title']
      new_entry.img_url = r['image_url']
      new_entry.source = r['source_url']

      new_entry.save
      new_entry
  end
    recipe_data.select(&:persisted?)
  end

  has_many :favorites
  has_many :users, through: :favorites
end
