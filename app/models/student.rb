# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  @@all = []
  
  def self.search(people=nil)
    if people.present?
      where('name like ?', "%#{people}%")
    else
      self.all
    end
  end
  
end
