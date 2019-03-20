class Message < ApplicationRecord
validates :body, presence: true, length: {minimum: 3, maximum: 50}
belongs_to :user

end
