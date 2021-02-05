# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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

    has_many :cat_rental_requests, dependent: :destroy
end
