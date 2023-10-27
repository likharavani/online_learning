class Course < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :pdfs
    has_many :progress

end
