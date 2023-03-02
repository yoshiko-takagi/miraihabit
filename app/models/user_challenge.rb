class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  after_create :generate_schedule
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
    schedule.select { |date, completed| date == Date.today.to_s }.map do |date, completed|
      [completed, challenge.name]
    end
  end
end
