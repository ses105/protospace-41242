require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do 
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプの投稿' do
    context 'プロトタイプの投稿ができるとき' do
      it 'title, catch_copy, concept, image が存在すれば登録できる' do
        expect(@prototype).to be_valid
      end
    end
    context 'プロトタイプの投稿ができないとき' do
      it 'titleが空では投稿できない' do
        @prototype.title = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it 'catch_copyが空では投稿できない' do
        @prototype.catch_copy = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'conceptが空では投稿できない' do
        @prototype.concept = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @prototype.user = nil
        @prototype.valid?
        binding.pry
        expect(@prototype.errors.full_messages).to include("User must exist")
      end
      it 'conceptが空では投稿できない' do
      end
      it 'imageが空では投稿できない' do
      end
    end
  end
end

