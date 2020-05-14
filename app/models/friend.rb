class Friend < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'user_id'
  belongs_to :friend_user, class_name: :User, foreign_key: 'friend_user_id'

  def self.list(user_id, status)
    sql = "select origin_friend.id, origin_friend.user_id, origin_friend.friend_user_id,origin_friend.status, select_friends.friend_id as friend_id from friends as origin_friend inner join
            (select f1.id, f1.friend_user_id as friend_id from friends as f1 where f1.user_id = '#{user_id}'
              union
            select f2.id, f2.user_id as friend_id from friends as f2 where f2.friend_user_id = '#{user_id}') as select_friends
          on origin_friend.id = select_friends.id where origin_friend.status = #{status}"
    return Friend.find_by_sql(sql)
  end

  def self.get_friend_user_id(user_id, friend_id)
    friend = Friend.find(friend_id)
    if (friend.user_id) == user_id
      return friend.friend_user_id
    else
      return friend.user_id
    end
  end
end
