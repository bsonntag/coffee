class Drink < ActiveRecord::Base
  belongs_to :user

  validates :user, :price, :category, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category, inclusion: { in: %w(coffee water) }

  scope :coffees, -> { where(category: 'coffee') }
  scope :waters, -> { where(category: 'water') }

  def time
    created_at.strftime('%R')
  end

  def date
    if created_at.today?
      'today'
    elsif yesterday? created_at
      'yesterday'
    else
      created_at.strftime('%d-%m-%y')
    end
  end

  private

  def yesterday?(date_time)
    date_time.beginning_of_day == 1.day.ago.beginning_of_day
  end
end
