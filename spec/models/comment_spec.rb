require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '#create' do
    context 'can save and can not save' do
      # コメントがなければ登録できないこと
      it 'is invalid without a body' do
        comment = build(:comment, body: nil)
        comment.valid?
        expect(comment.errors[:body]).to include('を入力してください')
      end

      # コメントが1000文字以内の場合は登録できること
      it 'is valid with a body that has less than 1000 characters' do
        comment = build(:comment, body: 'あ' * 1000)
        expect(comment).to be_valid
      end
      
      # コメントが1001文字以上の場合は登録できないこと
      it 'is invalid with a body that has more than 1001 characters' do
        comment = build(:comment, body: 'a' * 1001)
        comment.valid?
        expect(comment.errors[:body]).to include('は1000文字以内で入力してください')
      end

      # ユーザーIDがなければ登録できないこと
      it 'is invalid without a user_id' do
        comment = build(:comment, user_id: nil)
        comment.valid?
        expect(comment.errors[:user_id]).to include('を入力してください')
      end

      # サイトID (document_id) がなければ登録できないこと
      it 'is invalid without a document_id' do
        comment = build(:comment, document_id: nil)
        comment.valid?
        expect(comment.errors[:document_id]).to include('を入力してください')
      end
    end
  end
end
