require 'rails_helper'

describe User do
  describe '#create' do
    # nickname, email, password 及び password_confirmation が存在していれば登録できること
    it 'is valid with a nickname, email, password, password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end

    # nickname が空の場合は登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end

    # nickname が50文字以内の場合は登録できること
    it 'is valid with a nickname that has less than 50 characters' do
      user = build(:user, nickname: 'あ' * 50)
      expect(user).to be_valid
    end

    # nickname が51文字以上の場合は登録できないこと
    it 'is invalid with a nickname that has more than 51 characters' do
      user = build(:user, nickname: 'a' * 51)
      user.valid?
      expect(user.errors[:nickname]).to include('は50文字以内で入力してください')
    end

    # email が空の場合は登録できないこと
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    # email が重複している場合は登録できないこと
    it 'is invalid with a duplicate email address' do
      user1 = create(:user, email: 'aaa@gmail.com')
      user2 = build(:user, email: 'aaa@gmail.com')
      user2.valid?
      expect(user2.errors[:email]).to include('はすでに存在します')
    end

    # password が空の場合は登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    # password が5文字以下の場合は登録できないこと
    it 'is invalid with a password that has less than 5 characters' do
      user = build(:user, password: '12345')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    # password が6文字以上の場合は登録できること
    it 'is valid with a password that has more than 6 characters' do
      user = build(:user, password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user).to be_valid
    end

    # password が128文字以内の場合は登録できること
    it 'is valid with a password that has less than 128 characters' do
      user = build(:user, password: 'a' * 128, password_confirmation: 'a' * 128)
      user.valid?
      expect(user).to be_valid
    end

    # password が129文字以上の場合は登録できないこと
    it 'is invalid with a password that has more than 129 characters' do
      user = build(:user, password: 'a' * 129, password_confirmation: 'a' * 129 )
      user.valid?
      expect(user.errors[:password]).to include('は128文字以内で入力してください')
    end

    # password_confirmation が password と一致しない場合は登録できないこと
    it 'is invalid if password_confirmati does not match password' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end

  end
end
