require 'rails_helper'
RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save and can not save' do
      # タイトルがなくても送信できること
      it 'is valid without a title' do
        message = build(:message, title: nil)
        expect(message).to be_valid
      end

      # タイトルが255文字以内の場合は送信できること
      it 'is valid with a title that has less than 255 characters' do
        message = build(:message, title: 'あ' * 255)
        expect(message).to be_valid
      end
      
      # タイトルが256文字以上の場合は送信できないこと
      it 'is invalid with a title that has more than 256 characters' do
        message = build(:message, title: 'a' * 256)
        message.valid?
        expect(message.errors[:title]).to include('は255文字以内で入力してください')
      end
        
      # 本文がなければ送信できないこと
      it 'is valid without a text' do
        message = build(:message, text: nil)
        message.valid?
        expect(message.errors[:text]).to include('を入力してください')
      end
      
      # 本文が1000文字以内の場合は送信できること
      it 'is valid with a text that has less than 1000 characters' do
        message = build(:message, text: 'あ' * 1000)
        expect(message).to be_valid
      end
      
      # 本文が1001文字以上の場合は送信できないこと
      it 'is invalid with a text that has more than 1001 characters' do
        message = build(:message, text: 'a' * 1001)
        message.valid?
        expect(message.errors[:text]).to include('は1000文字以内で入力してください')
      end
        
      # ユーザーIDがなければ送信できないこと
      it 'is invalid without a user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user_id]).to include('を入力してください')
      end
    end
  end
end
