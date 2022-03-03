class Task < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :finish, presence: true

end
