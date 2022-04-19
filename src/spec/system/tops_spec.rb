
require 'rails_helper'

RSpec.describe 'Top', type: :system do
  it 'shows greeting' do
    # root_pathへアクセス
    visit root_path
    # ページ内に'Hello World!'が含まれているかを検証
    expect(page).to have_content 'あなたが思った漫画を当ててみせましょう'
  end
end
