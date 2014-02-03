require './lib/key_vault'

describe KeyVault do

  describe '.[]' do
    before do
      KeyVault.stub values: { session_secret: "secret" }
    end

    it 'returns the value from key_vault.yml' do
      KeyVault[:session_secret].should == "secret"
    end

    it 'raises an error if the key wasnt found' do
      expect { KeyVault[:unknown] }.to raise_error(ArgumentError)
    end
  end

  describe '.keys' do
    before do
      KeyVault.stub values: { session_secret: "secret" }
    end

    it 'returns the list of keys' do
      KeyVault.keys.should include(:session_secret)
    end
  end

  describe '.values' do
    before do
      Rails.stub root: '/tmp/'
      FileUtils.mkdir '/tmp/config'
    end

    after do
      FileUtils.rm_rf '/tmp/config'
    end

    it 'reads key_vault.yml in the rails config folder' do
      File.open('/tmp/config/key_vault.yml', 'w') do |f|
        f.puts({ session_secret: 'super_secret' }.to_yaml)
      end

      KeyVault.values[:session_secret].should == 'super_secret'
    end
  end
end
