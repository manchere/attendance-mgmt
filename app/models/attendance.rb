# == Schema Information
#
# Table name: attendances
#
#  id                   :uuid             not null, primary key
#  status               :string
#  datetime_of_presence :datetime
#  present              :boolean
#  body_temperature     :float
#  user_id              :uuid
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Attendance < ApplicationRecord

    # modules
    include DateFormat

    # relationships
    belongs_to :user

    # validations
    validates :body_temperature, presence: true
    validates :datetime_of_presence, presence: true

    # scopes
    scope :body_temp_above, -> (temp) { where('body_temperature > ?', temp) }
    scope :past_week, -> { where(datetime_of_presence: Time.zone.now.at_beginning_of_week...Time.zone.now.at_end_of_week ) }
    scope :punctual, -> { where(status: 'Punctual') }
    scope :latest_check_in, -> { order(datetime_of_presence: :desc) }
    scope :total_attendance, -> (id) { where(user_id: id).count }
    scope :last_temperature, -> (id) { where(user_id: id).latest_check_in.first }

    # (0°C × 9/5) + 32 = 32°F
    def temp_in_farenheit
      (body_temperature * (9/5)) + 32
    end 
end
