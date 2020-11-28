# frozen_string_literal: true

require 'json'
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
          var targets = #{socks_proxy_targets};
          var proxySettingsString = "SOCKS #{socks_proxy_host}:#{socks_proxy_port}";

          function FindProxyForURL(url, host) {
            if (targets.some(target => shExpMatch(host, target))) {
              return proxySettingsString;
            } else {
              return "DIRECT";
            }
          }
        __EOF__
      end

      def socks_proxy_host
        Environment.socks_proxy_host
      end

      def socks_proxy_port
        Environment.socks_proxy_port
      end

      def socks_proxy_targets
        Environment.socks_proxy_targets.to_json
      end
    end
  end
end
