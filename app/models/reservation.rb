class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :users_num, presence: true, numericality: true
  validate :checkin_checkout_check

  def checkin_checkout_check
    if check_in && check_out
      errors.add(:check_out,"はチェックイン以降の日付を記入してください。") if self.check_in >= self.check_out
    end
  end
end
