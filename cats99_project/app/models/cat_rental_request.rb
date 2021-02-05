# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord

    STATUS_CODES = %w(PENDING APPROVED DENIED).freeze

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: STATUS_CODES, message: "must be a status code"}
    validate :does_not_overlap_approved_request

    belongs_to :cat

    def overlapping_requests
        # find all overlapping cat rental requests of the same cat
        # we have cat_id in our instance
        # Case 1
        # this:     |______|
        # ol:   |____________|

        # Case 2
        # this:    |______|
        # ol:           |________|

        # Case 3
        # this:    |______|
        # ol:  |________|

        # Case 4
        # this:    |____________|
        # ol:         |______|

        # debugger
        CatRentalRequest
            .select(:id)
            .where(cat_id: cat_id)
            .where.not(id: id)
            .where.not('start_date > ? OR end_date < ?', end_date, start_date)
    end

    def overlapping_approved_requests
        # debugger
        self.overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
        # debugger
       if self.overlapping_approved_requests.exists?
            errors[:base] << 'Conflict in approved request'
       end
    end
end
