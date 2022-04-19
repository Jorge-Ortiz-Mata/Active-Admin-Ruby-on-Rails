class Subject < ApplicationRecord
    has_rich_text :body
    has_many :notes
end
