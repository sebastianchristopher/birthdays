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

  def days_until
    if @birthday.day - Date.today.day < 0
      year = Date.today.year + 1
    else
      year = Date.today.year
    end
    puts "year = #{year}"
    (Date.new(year, @birthday.month, @birthday.day) - Date.today).to_i
  end
end
