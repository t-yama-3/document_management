require 'rails_helper'
RSpec.describe Profile, type: :model do
  describe '#create' do
    context 'can save and can not save' do
      # 自己紹介がなくても送信できること
      it 'is valid without a introduction' do
        profile = build(:profile, introduction: nil)
        expect(profile).to be_valid
      end

      # 自己紹介が1000文字以内の場合は送信できること
      it 'is valid with a introduction that has less than 1000 characters' do
        profile = build(:profile, introduction: 'あ' * 1000)
        expect(profile).to be_valid
      end
      # 自己紹介が1001文字以上の場合は送信できないこと
      it 'is invalid with a introduction that has more than 1001 characters' do
        profile = build(:profile, introduction: 'a' * 1001)
        profile.valid?
        expect(profile.errors[:introduction]).to include('は1000文字以内で入力してください')
      end
      
      # 所在地がなくても送信できること
      it 'is valid without a prefecture' do
        profile = build(:profile, prefecture: nil)
        expect(profile).to be_valid
      end
      
      # ユーザーIDがなければ送信できないこと
      it 'is invalid without a user_id' do
        profile = build(:profile, user_id: nil)
        profile.valid?
        expect(profile.errors[:user_id]).to include('を入力してください')
      end
    end
  end
end
