class Recipe < ApplicationRecord
  include HTTParty
  ENV["FOOD2FORK_KEY"] = '66b0beee88b465a1e7f21edcb82ba7db'
  base_uri 'http://food2fork.com/api'
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for term
  get("/search", query: { q: term})["recipes"]
  end

  has_many :favorites
  has_many :users, through: :favorites
end
