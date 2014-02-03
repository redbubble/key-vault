require "rails"

require "key_vault"

module KeyVault
  class Railtie < Rails::Railtie
    rake_tasks do
      load Pathname.new(__FILE__).dirname + '../../tasks/key_vault.rake'
    end
  end
end
