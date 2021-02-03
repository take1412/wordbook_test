require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目に正常に入力ができていると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'ニックネームが10文字以上だと登録できない' do
        @user.nickname = '12345678912'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは10文字以内で入力してください')
      end

      it 'ユーザーコードが空だと登録できない' do
        @user.user_code = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーコードを入力してください')
      end

      it 'ユーザーコードが8文字以上だと登録できない' do
        @user.user_code = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーコードは8文字以内で入力してください')
      end

      it 'ユーザーコードが8文字以上だと登録できない' do
        @user.user_code = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーコードは8文字以内で入力してください')
      end

      it '重複しているユーザーコードが存在していたら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.user_code = @user.user_code
        another_user.valid?
        expect(another_user.errors.full_messages).to include('ユーザーコードはすでに存在します')
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it '重複しているメールアドレスが存在していたら登録できない。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'パスワードが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが英字と数字両方含まれていないと登録できない。' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字どちらも1文字以上入れてください')
      end

      it 'パスワードと確認用パスワードが一致していないと登録できない。' do
        @user.password_confirmation = 'a12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
    end
  end
end
