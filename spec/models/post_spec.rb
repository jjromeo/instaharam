require 'rails_helper'

describe Post, type: :model do 
  before do 
  end

  it { should have_many :comments }
  it { should have_many :likes }
  it { should respond_to :caption}

end
