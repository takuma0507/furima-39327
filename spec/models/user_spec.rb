require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します
    context '新規登録できるとき' do
      it '全てのカラムの値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '123456789'
        @user.password_confirmation = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = 'abcde'
        @user.password_confirmation = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = 'あ位ウえお'
        @user.password_confirmation = 'あ位ウえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it '名字は（全角）でなければ登録できない' do
        @user.surname = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname is invalid')
      end
      it '名字が空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it '名は（全角）でなければ登録できない' do
        @user.giben_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Giben name is invalid')
      end
      it '名が空では登録できない' do
        @user.giben_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Giben name can't be blank")
      end
      it '名字カナは（全角）でなければ登録できない' do
        @user.surname_katakana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname katakana is invalid')
      end
      it '名字カナが空では登録できない' do
        @user.surname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname katakana can't be blank")
      end
      it '名カナが空では登録できない' do
        @user.giben_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Giben name katakana can't be blank")
      end
      it '名カナは（全角）でなければ登録できない' do
        @user.giben_name_katakana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Giben name katakana is invalid')
      end

      it '生年月日が空では登録できない' do
        @user.dete_of_bith = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Dete of bith can't be blank")
      end
    end
  end
end
