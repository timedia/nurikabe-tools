# frozen_string_literal: true

module Nurikabe
  module ProxyPac
    class Environment
      class << self
        def socks_proxy_host
          ENV['SOCKS_PROXY_HOST'] || ifaddr.addr.ip_address
        end

        def socks_proxy_port
          ENV['SOCKS_PROXY_PORT'] || 1080
        end

        def socks_proxy_targets
          ENV.fetch('SOCKS_PROXY_TARGETS', '').split(',')
        end

        private

        def ifaddr
          @ifaddr ||= Socket.getifaddrs.find do |ifaddr|
            ifaddr.name == network_interface && ifaddr.addr.ipv4?
          end
        end

        def network_interface
          ENV['NETWORK_INTERFACE'] || macos? ? 'en0' : 'eth0'
        end

        def macos?
          RUBY_PLATFORM.match?(/darwin/)
        end
      end
    end
  end
end
