class Student < ApplicationRecord
  belongs_to :instructor

  validates :age, numericality: { greater_than_or_equal_to: 18, message: "must be greater than 25"}
end
