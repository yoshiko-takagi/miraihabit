class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  after_create :generate_schedule
  before_update :set_completed

  # validates :json ??
  def generate_schedule
    new_schedule = {}
    (Date.today...Date.tomorrow + challenge.duration).to_a.each do |date|
      new_schedule[date] = false
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
end
