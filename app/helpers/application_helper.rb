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

  # friend.statusを返す（該当なしは-1を返す）
  def friend_status(user1, user2)
    return -2 unless user1.friends.present?
    if (friend = user1.friends.find_by(friend_user_id: user2.id)).present?
      return friend.status
    else
      return -1
    end
  end

  def get_friend_id(user1, user2)
    if user1.friends.present? && (friend = user1.friends.find_by(friend_user_id: user2.id)).present?
      return friend.id
    elsif user2.friends.present? && (friend = user2.friends.find_by(friend_user_id: user1.id)).present?
      return friend.id
    else
      return - 1
    end
  end
end
