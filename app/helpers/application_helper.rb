module ApplicationHelper
  def elapsed_time(time)
    t = ((Time.new - time) / 3600)
    if t > 24
      return "#{(t / 24).floor}日前"
    else
      return "#{t.floor}時間前"
    end
  end
end
