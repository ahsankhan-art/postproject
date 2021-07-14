class Post < ApplicationRecord
    has_many:likes, dependent: :destroy
    has_many:users, :through => :likes

    validates :post, presence: true
    validates :description, presence: true
end
