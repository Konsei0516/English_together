require 'rails_helper'
require 'support/factory_bot'

describe User do
  describe '#create' do
    it "値が全て存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "nameが８文字以上だと登録できないこと" do
      user = build(:user, name: "kkkkkkkkk")
      user.valid?
      expect(user.errors[:name]).to include("は8文字以内で入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end