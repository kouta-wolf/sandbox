# frozen_string_literal: true

RSpec.describe 'JSON generation' do
  it '50人分のデータが入ったJSONファイルを出力すること' do
    load File.expand_path('../json.rb', __dir__)

    file_path = File.expand_path('../users.json', __dir__)
    expect(File.exist?(file_path)).to be true

    json_data = JSON.parse(File.read(file_path))
    expect(json_data.length).to eq 50
    expect(json_data.first).to have_key('username')
  end
end
