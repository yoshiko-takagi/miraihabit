class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  after_create :generate_schedule
  before_update :set_completed

  # validates :json ??
  def generate_schedule
    new_schedule = {}
    index = 0
    challenge.duration.times do
      new_schedule[created_at.to_date + 1 + index] = false
      index += 1
    end
    self.schedule = new_schedule
    save
  end

  def schedule_form_data
    schedule.select { |date, _completed| date == Date.today.to_s }
  end

  def set_completed
    all_complete = schedule.all? { |_date, completed| completed }
    if all_complete
      self.completed = true
    else
      self.completed = false
    end
  end

  # (created_at + 1)...((created_at + 1 ) +
end
