require 'rails_helper'

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe '単語登録' do
    context '単語登録がうまくいくとき' do
      it '全ての項目に正常に入力ができていると登録できる' do
        expect(@word).to be_valid
      end
    end

    context '単語登録が上手くいかない時' do
      it '単語の名前が空だと登録できない' do
        @word.wordname = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("単語の名前を入力してください")
      end

      it '単語の意味が空だと登録できない' do
        @word.mean = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("単語の意味を入力してください")
      end

      it 'userが紐付いていないと登録できない' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("Userを入力してください")
      end

      it 'wordlistが紐付いていないと登録できない' do
        @word.wordlist = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("Wordlistを入力してください")
      end
    end
  end
end