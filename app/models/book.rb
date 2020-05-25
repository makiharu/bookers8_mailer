class Book < ApplicationRecord
	belogns_to :user
	validates :title, presrncr: true, length: {maximumm: 50}
  	validates :body, presence: true, legnth: {minimum: 2, maximum: 200}
end
