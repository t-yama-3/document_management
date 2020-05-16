require 'rails_helper'
RSpec.describe Section, type: :model do
  describe '#create' do
    context 'can save and can not save' do
      # 区分名がなければ登録できないこと
      it 'is invalid without a section_name' do
        section = build(:section, section_name: nil)
        section.valid?
        expect(section.errors[:section_name]).to include('を入力してください')
      end

      # 区分名が255文字以内の場合は登録できること
      it 'is valid with a section_name that has less than 255 characters' do
        participate_user_params = build_list(:user, 3)
        section = build(:section, section_name: 'あ' * 255, participate_users: participate_user_params)
        expect(section).to be_valid
      end
      
      # 区分名が256文字以上の場合は登録できないこと
      it 'is invalid with a section_name that has more than 256 characters' do
        section = build(:section, section_name: 'a' * 256)
        section.valid?
        expect(section.errors[:section_name]).to include('は255文字以内で入力してください')
      end
        
      # 主旨がなくても登録でること
      it 'is valid without a gist' do
        participate_user_params = build_list(:user, 3)
        section = build(:section, gist: nil, participate_users: participate_user_params)
        expect(section).to be_valid
      end
      
      # 主旨が1000文字以内の場合は登録できること
      it 'is valid with a gist that has less than 1000 characters' do
        participate_user_params = build_list(:user, 3)
        section = build(:section, gist: 'あ' * 1000, participate_users: participate_user_params)
        expect(section).to be_valid
      end
      
      # 主旨が1001文字以上の場合は登録できないこと
      it 'is invalid with a gist that has more than 1001 characters' do
        section = build(:section, gist: 'a' * 1001)
        section.valid?
        expect(section.errors[:gist]).to include('は1000文字以内で入力してください')
      end
        
      # 公開範囲がなければ登録できないこと
      it 'is invalid without a disclosure' do
        section = build(:section, disclosure: nil)
        section.valid?
        expect(section.errors[:disclosure]).to include('を入力してください')
      end

      # ユーザーIDがなければ登録できないこと
      it 'is invalid without a user_id' do
        section = build(:section, user_id: nil)
        section.valid?
        expect(section.errors[:user_id]).to include('を入力してください')
      end
    end
  end
end
