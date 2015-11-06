class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true

  def time
    created_at.strftime('%R')
  end

  def date
    if created_at.today?
      'today'
    elsif created_yesterday?
      'yesterday'
    else
      created_at.strftime('%d-%m-%y')
    end
  end

  private

  def created_yesterday?
    created_at.beginning_of_day == 1.day.ago.beginning_of_day
  end
end
