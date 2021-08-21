require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数両方を含み6文字以上であれば登録できること' do
        @user.password = 'Test0000'
        @user.password_confirmation = 'Test0000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nikcnameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が存在しないと保存できないこと' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password = 'Test0000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していなければ登録できないこと' do
        @user.password = 'Test0000'
        @user.password_confirmation = 'test0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'testpassword'
        @user.password_confirmation = 'testpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'passwordが半角数字のみでは登録できないこと' do
        @user.password = '05604456'
        @user.password_confirmation = '05604456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'passwordが全角の場合は登録できないこと' do
        @user.password = 'ｔｅｓｔ００００'
        @user.password_confirmation = 'ｔｅｓｔ００００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'tes00'
        @user.password_confirmation = 'tes00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
