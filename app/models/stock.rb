class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
        publishable_token: 'pk_2483a2dd284d4bb898ae3ecf327c4a9d',
        secret_token: 'sk_642253341ce146c0bb79d001b5a4d030',
        endpoint: 'https://cloud.iexapis.com/v1'
        )

        client.price(ticker_symbol)
    end
end
