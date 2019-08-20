class Birthday
  attr_accessor :name, :birthday
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def age
    now = Time.now.utc.to_date
    now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
  end
end
