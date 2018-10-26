class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :multirecipients
  has_many :users, through: :multirecipients
end
