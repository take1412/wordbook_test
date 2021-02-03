require 'rails_helper'

RSpec.describe Wordlist, type: :model do
  before do
    @wordlist = FactoryBot.build(:wordlist)
  end

  describe 'リスト登路' do
    context 'リスト登録がうまくいくとき' do
      it '全ての項目に正常に入力ができていると登録できる' do
        expect(@wordlist).to be_valid
      end
    end

    context 'リスト登録がうまくいかないとき' do
      it 'リストの名前が空だと登録できない' do
        @wordlist.listname = nil
        @wordlist.valid?
        expect(@wordlist.errors.full_messages).to include('リストの名前を入力してください')
      end

      it '説明文が空だと登録できない' do
        @wordlist.text = nil
        @wordlist.valid?
        expect(@wordlist.errors.full_messages).to include('説明文を入力してください')
      end

      it '公開・非公開どちらか設定していないと登録できない' do
        @wordlist.release_id = 0
        @wordlist.valid?
        expect(@wordlist.errors.full_messages).to include('公開・非公開どちらか設定してください')
      end

      it 'userが紐付いていないと登録できない' do
        @wordlist.user = nil
        @wordlist.valid?
        expect(@wordlist.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
