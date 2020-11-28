# frozen_string_literal: true

require_relative 'environment'

module Nurikabe
  module ProxyPac
    class App
      def call(env)
        request = Rack::Request.new(env)

        case request.path
        when '/proxy.pac'
          [200, {}, [proxy_pac]]
        else
          [404, {}, []]
        end
      end

      private

      def proxy_pac
        <<~__EOF__
          var proxySettingsString = "SOCKS #{socks_proxy_host}:#{socks_proxy_port}";

          function FindProxyForURL(url, host) {
            return proxySettingsString;
          }
        __EOF__
      end

      def socks_proxy_host
        Environment.socks_proxy_host
      end

      def socks_proxy_port
        Environment.socks_proxy_port
      end
    end
  end
end
