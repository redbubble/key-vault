require "yaml"

require "key_vault/version"
require "key_vault/railtie"

module KeyVault
  class << self
    def [](key)
      if values.has_key?(key)
        values[key]
      else
        raise ArgumentError, "'#{key}' not found in key_vault.yml"
      end
    end

    def keys
      values.keys
    end

    def values
      @values ||= YAML.load(ERB.new(IO.read(Rails.root + "config/key_vault.yml")).result).symbolize_keys
    end
  end
end
