class Contact < ApplicationRecord
  def month_day_year
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japanese_phone
    "+81 #{phone_number}"
  end
end
