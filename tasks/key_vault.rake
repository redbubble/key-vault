namespace :key_vault do

  desc "Check if the given set of keys matches the key vault keys on the local file system"
  task check: :environment do
    local_keys  = ENV['LOCAL_KEYS'].split(',').map(&:to_sym)
    server_keys = KeyVault.keys

    missing_local = server_keys - local_keys
    if !missing_local.empty?
      puts "\e[30m\e[43mWarning: The local key_vault.yml file is missing: #{missing_local.join(', ')}\e[39m\e[49m"
    end

    missing_server = local_keys - server_keys
    if !missing_server.empty?
      fail "The server key_vault.yml file is missing: #{missing_server.join(', ')}"
    end
  end
end
