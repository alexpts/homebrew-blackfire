#encoding: utf-8

require File.expand_path("../../Abstract/abstract-blackfire-php-extension", __FILE__)

class BlackfirePhp56 < AbstractBlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '1.11.1'

    url 'http://packages.blackfire.io/homebrew/blackfire-php_1.11.1-darwin_amd64-php56.tar.gz'
    sha256 '57a6c0c2e40b1e628448350c6ad2c4a0f03ed13a06df1329b6896570827f8a27'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<-EOS.undent
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        blackfire.agent_timeout = 0.25
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log
        ;blackfire.server_id =
        ;blackfire.server_token =
        EOS
    end
end
