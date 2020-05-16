require 'rails_helper'
RSpec.describe Document, type: :model do
  describe '#create' do
    context 'can save and can not save' do
      # タイトルがなければ登録できないこと
      it 'is invalid without a title' do
        document = build(:document, title: nil)
        document.valid?
        expect(document.errors[:title]).to include('を入力してください')
      end

      # タイトルが255文字以内の場合は登録できること
      it 'is valid with a title that has less than 255 characters' do
        document = build(:document, title: 'あ' * 255)
        expect(document).to be_valid
      end
      
      # タイトルが256文字以上の場合は登録できないこと
      it 'is invalid with a title that has more than 256 characters' do
        document = build(:document, title: 'a' * 256)
        document.valid?
        expect(document.errors[:title]).to include('は255文字以内で入力してください')
      end
        
      # 説明がなくても登録できること
      it 'is valid without a note' do
        document = build(:document, note: nil)
        expect(document).to be_valid
      end
      
      # 説明が1000文字以内の場合は登録できること
      it 'is valid with a note that has less than 1000 characters' do
        document = build(:document, note: 'あ' * 1000)
        expect(document).to be_valid
      end
      
      # 説明が1001文字以上の場合は登録できないこと
      it 'is invalid with a note that has more than 1001 characters' do
        document = build(:document, note: 'a' * 1001)
        document.valid?
        expect(document.errors[:note]).to include('は1000文字以内で入力してください')
      end
        
      # ユーザーIDがなければ登録できないこと
      it 'is invalid without a user_id' do
        document = build(:document, user_id: nil)
        document.valid?
        expect(document.errors[:user_id]).to include('を入力してください')
      end

      # 区分がなければ登録できないこと
      it 'is invalid without a section_id' do
        document = build(:document, section_id: nil)
        document.valid?
        expect(document.errors[:section_id]).to include('を入力してください')
      end
    end
  end
end
