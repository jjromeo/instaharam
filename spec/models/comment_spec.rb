require 'rails_helper'

describe Comment, type: :model do 
  it { should belong_to :user }
  it { should belong_to :post }

  it 'should be able to reference the hashtags in it\'s post' do 
  end
end

