class Quote < ApplicationRecord
  # all our model must have a name to be valid, so we add a validation
  validates :name, presence: true
end
