class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_client[:public_key],
        secret_token: Rails.application.credentials.iex_client[:secret_key],
        endpoint: 'https://cloud.iexapis.com/v1'
        )
        
        begin
            company = client.company(ticker_symbol)
            new(ticker: ticker_symbol, name: company.company_name, last_price: client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end
end
