class Persona < ApplicationRecord
	validates :name, presence: true, length: { maximum: 10 }
	validates :pv, presence: true
	validates :pa, presence: true
end
