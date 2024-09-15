module Users
  class User < ApplicationRecord
    validates :username, uniqueness: true
  end
end