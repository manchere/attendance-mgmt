# == Schema Information
#
# Table name: users
#
#  id           :uuid             not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  address      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#
class User < ApplicationRecord

    # modules
    include DateFormat

    # entension
    extend FriendlyId

    # relationships
     has_many :attendances 

    # validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :address, presence: true
    validates :phone_number, uniqueness: true
    validates :phone_number, presence: { message: 'invalid phone number, please provide a valid phone number!' },
              numericality: true,
              length: { minimum: 10, maximum: 15 }
    
    # nested attributes
    accepts_nested_attributes_for :attendances#, :reject_if => proc { |attendance_reject| attendance_reject['present'] == false }

    friendly_id :sluggish_id, use: :slugged
    
    scope :is_punctual, -> { joins(:attendances).merge(Attendance.punctual) }
    scope :latest_check_in, -> { joins(:attendances).order(datetime_of_presence: :desc) }
    scope :retrieve, -> (search) { User.where('first_name LIKE ? OR last_name LIKE ? OR phone_number = ?', "%#{search}%", "%#{search}%", search) }
    scope :attendance_of, -> (id) { latest_check_in.where('attendances.user_id = ?', id) }

    def full_name
      "#{first_name} #{last_name}"
    end

    def sluggish_id
      "#{first_name[0].to_s.capitalize}#{last_name[0].to_s.capitalize}#{phone_number}"
    end

    def self.search(search)
      if search.present?
        user = User.retrieve(search)
        if user
          self.retrieve(search)
        else
          @users = User.latest_check_in.limit(4)
        end
      else
        @users = User.latest_check_in.limit(4)
      end
    end
end

