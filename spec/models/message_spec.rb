require 'rails_helper'

describe Message do
  before do
    @message = FactoryBot.build(:message)
  end
    
  describe 'メッセージ機能' do
    context 'メッセージが保存できるとき' do
      it 'textが存在していれば保存できること' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージが保存できないとき' do
      it 'textが空では保存できないこと' do
        @message.text = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Text can't be blank" )
      end

      it 'userが紐づいていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
      
      it 'itemが紐づいていないと保存できないこと' do
        @message.item = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Item must exist")
        
      end
    end
  end
end
