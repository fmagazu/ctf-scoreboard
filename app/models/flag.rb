class Flag < ActiveRecord::Base
  belongs_to :challenge

  has_many :solved_challenges

  validates :flag, :challenge, presence: true
end
