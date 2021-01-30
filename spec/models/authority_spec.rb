require 'rails_helper'

RSpec.describe Authority, type: :model do
  before do
    @authority = FactoryBot.build(:authority)
  end

  describe 'ユーザーコード登録' do
    context 'ユーザーコード登録がうまくいくとき' do
      it '全ての項目に正常だと登録できる' do
        expect(@authority).to be_valid
      end
    end

    context 'ユーザーコード登録が上手くいかない時' do
      it 'ユーザーコードが空だと登録できない' do
        @authority.authority_user_code = nil
        @authority.valid?
        expect(@authority.errors.full_messages).to include("ユーザーコードを入力してください")
      end

      it 'ユーザーコードが9文字以上だと登録できない' do
        @authority.authority_user_code = '123456789'
        @authority.valid?
        expect(@authority.errors.full_messages).to include("ユーザーコードは8文字以内で入力してください")
      end

      it '同じリストに重複しているユーザーコードが存在していたら登録できない' do
        @authority.save
        another_authority = FactoryBot.build(:authority)
        another_authority.authority_user_code = @authority.authority_user_code
        another_authority.wordlist_id = @authority.wordlist_id
        another_authority.valid?
        expect(another_authority.errors.full_messages).to include("ユーザーコードはすでに存在します")
      end
    end
  end
end
