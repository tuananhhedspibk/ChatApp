class User < ApplicationRecord
	has_many :messages
	has_many :rooms, through: :messages

	validates :name, presence: true, uniqueness: true
end