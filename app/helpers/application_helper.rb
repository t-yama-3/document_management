module ApplicationHelper
  def elapsed_time(time)
    t = ((Time.new - time) / 60)
    if t > (24 * 60)
      return "#{(t / (24 * 60)).floor}日前"
    elsif t > 60
      return "#{(t / 60).floor}時間前"
    elsif t > 1
      return "#{t.floor}分前"
    else
      return "たった今"
    end
  end
end
