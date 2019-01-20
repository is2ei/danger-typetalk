module Danger
  class Typetalk < Plugin

    attr_accessor :token
    attr_accessor :topic_id

    def initialize(dangerfile)
      super(dangerfile)

      @token = ENV['TYPETALK_TOKEN']
      @topic_id = ENV['TYPETALK_TOPIC_ID']
    end

    def notify
      return if topic_id.nil?
      post_message(report)
    end

    private

    def report
      r = status_report
            .reject { |_, v| v.empty? }
            .map do |k, v|
        case k.to_json
        when 'errors' then
          "[ERROR]\n" + v.join("\n")
        when 'warnings' then
          "[WARNING]\n" + v.join("\n")
        end
      end
      r.join("\n\n")
    end

    def post_message(msg)
      uri = URI("typetalk.com/api/v1/topics/#{@topic_id}")
      body = { message: msg }.to_json
      post(uri, body)
    end

    def post(uri, body)
      req = Net::HTTP::Post.new(uri.request_uri, { 'Content-Type' => 'application/json' })
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
    end
  end
end