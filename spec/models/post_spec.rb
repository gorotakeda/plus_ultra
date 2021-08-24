require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '新規投稿の保存' do
    context '新規投稿が保存できる場合 ' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it 'titleが空では保存できないこと' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'mealが空では保存できないこと' do
        @post.meal = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Meal can't be blank")
      end
      it 'workoutが空では保存できないこと' do
        @post.workout = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Workout can't be blank")
      end
      it 'sex_idが0では保存できないこと' do
        @post.sex_id = '0'
        @post.valid?
        expect(@post.errors.full_messages).to include('Sex must be other than 0')
      end
      it 'age_idが0では保存できなこと' do
        @post.age_id = '0'
        @post.valid?
        expect(@post.errors.full_messages).to include('Age must be other than 0')
      end
      it 'style_idが0では保存できなこと' do
        @post.style_id = '0'
        @post.valid?
        expect(@post.errors.full_messages).to include('Style must be other than 0')
      end
      it 'purpose_idが0では保存できなこと' do
        @post.purpose_id = '0'
        @post.valid?
        expect(@post.errors.full_messages).to include('Purpose must be other than 0')
      end
      it 'userが紐付いていないと保存できないこと' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
