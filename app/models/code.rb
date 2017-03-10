class Code < ApplicationRecord
  belongs_to :game

  validates_presence_of :value
  
end
