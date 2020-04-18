require 'rails_helper'
require 'support/factory_bot'
RSpec.describe Word, type: :model do
  describe '#create' do
    context '保存ができる場合' do
      it '必要な値が全て存在すれば登録できること' do
        expect(build(:word)).to be_valid
      end

      it 'nameが英字であれば登録できること' do
        expect(build(:word, name: "english")).to be_valid
      end

      it 'descriptionがあれば登録できること' do
        expect(build(:word, description: "english")).to be_valid
      end

      it 'categoryがあれば登録できること' do
        expect(build(:word, category: "単語")).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'nameが無ければ登録できないこと' do
        log = build(:word, name: "")
        log.valid?
        expect(log.errors[:name]).to include("を入力してください")
      end

      it 'descriptionが無ければ登録できないこと' do
        log = build(:word, description: "")
        log.valid?
        expect(log.errors[:description]).to include("を入力してください")
      end

      it 'categoryが無ければ登録できないこと' do
        log = build(:word, category: "")
        log.valid?
        expect(log.errors[:category]).to include("を入力してください")
      end

      it 'user_idが無ければ登録できないこと' do
        log = build(:word, user_id: "")
        log.valid?
        expect(log.errors[:user]).to include("を入力してください")
      end
    end
  end
end