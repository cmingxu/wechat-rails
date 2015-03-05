module Wechat
  class JsApiTicket
    attr_reader :js_api_ticket

    def initialize(js_api_ticket)
      @js_api_ticket = js_api_ticket
    end

    def ticket
      begin
        @ticket_data ||= JSON.parse(File.read(js_api_ticket))
      rescue
        self.refresh
      end
      return valid_js_api_ticket(@ticket_data)
    end

    def store
    end

    private 
    def valid_js_api_ticket token_data
      access_token = token_data["access_token"]
      raise "Response didn't have access_token" if  access_token.blank?
      return access_token
    end

  end
end
