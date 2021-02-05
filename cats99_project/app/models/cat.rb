require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = %w(brown yellow white black orange blue red).freeze()
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: { in: %w(M F), message: "Can only be either M or F" }
    validates :color, inclusion: { in: COLORS, message: "Can only be a valid color" }

    def age
        time_ago_in_words(birth_date)
    end
end