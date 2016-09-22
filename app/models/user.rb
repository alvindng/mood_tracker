class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :user_profile
  has_many :entries

  def totalMood
    total = 0
    self.entries.each do |entry|
      total = entry.work + entry.social + entry.health + entry.education
    end
    return total
  end

  def averageMood
    self.totalMood.to_i/self.entries.count
  end


end
