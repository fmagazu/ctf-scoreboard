class Category < ActiveRecord::Base
  
  belongs_to :game
  
  has_many :challenges
  
  validates :name, :game_id, presence: true
  
  # The next challenge can have a greater than or equal to point value of the current one 
  # and has a name that comes after the current one. The order in which elements are returned
  # to self.challenges in is set in the challenges model.
  def next_challenge(challenge)
    # Order of challenges is handled by default scope in challenge.rb
    challenges = self.challenges
    index = challenges.find_index(challenge)
    challenges.at(index + 1)
  end
  
end
