module VagrantPlugins
  module FwdPorts
    class Plugin < Vagrant.plugin('2')
      name 'FwdPorts'
      description <<-DESC
        This plugin shows number of forwarded ports on your guest machine.
      DESC

      command(:fwdports) do
        setup_i18n
        require_relative 'command'
        Command
      end

      def self.setup_i18n
        I18n.load_path << File.expand_path('../../../locales/en.yml', __FILE__)
        I18n.reload!
      end
    end
  end
end
