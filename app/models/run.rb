class Run < ApplicationRecord
  belongs_to :route
  belongs_to :user
  has_many :run_sessions
  has_many :participants, through: :run_sessions, class_name: "User", source: "user"


  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :speed, presence: true

  def self.upcoming_runs(user)
    user.runs.where("end_time > ?", Time.now)
  end
end
