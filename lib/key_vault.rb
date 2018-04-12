require "yaml"

require "key_vault/version"
require "key_vault/railtie"

module KeyVault
  class << self
    def [](key)
      if values.has_key?(key)
        values[key]
      else
        raise ArgumentError, "'#{key}' not found in #{vault_file}"
      end
    end

    def keys
      values.keys
    end

    def values
      @values ||= YAML.load(vault).symbolize_keys
    end

    private
    def vault
      ERB.new(IO.read(vault_file)).result
    end

    def vault_file
      files = [
        File.join(Rails.root, "config/key_vault.yml")),
        File.join(Rails.root, "config/key_vault/#{Rails.env}.yml")),
      ]

      files.select {|f| File.exist? f }.first
    end
  end
end
