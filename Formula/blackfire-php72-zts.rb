#encoding: utf-8

require File.expand_path("../../Abstract/abstract-blackfire-php-extension", __FILE__)

class BlackfirePhp72Zts < AbstractBlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '1.49.0'

    url 'https://packages.blackfire.io/homebrew/blackfire-php_1.49.0-darwin_amd64-php72-zts.tar.gz'
    sha256 '77af4dcac2adb281c447183c3abcfa3cf0cea75b27c2a6fe3f0c99ff79dd99e7'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<~EOS
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_id =

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_token =
        EOS
    end
end
