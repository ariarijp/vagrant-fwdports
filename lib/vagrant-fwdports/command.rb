require 'terminal-table'
require 'pp'

module VagrantPlugins
  module FwdPorts
    class FwdPortsError < Vagrant::Errors::VagrantError
      error_namespace("vagrant-fwdports.errors")
    end

    class Command < Vagrant.plugin("2", :command)
      include Vagrant::Util::SafePuts

      def self.synopsis
        "outputs list of forwarded ports on the vagrant machine"
      end

      def execute
        options = {}

        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant fwdports"
        end

        argv = parse_options(opts)
        return if !argv

        results = []
        state = nil;

        with_target_vms(argv) do |machine|
          id =  machine.id
          name =  machine.name
          state = machine.state
          provider = machine.provider
          driver = provider.driver

          if state.id != :running
            raise FwdPortsError.new :vm_is_not_running
          elsif machine.provider_name != :virtualbox
            raise FwdPortsError.new :provider_not_supported
          end

          driver.read_forwarded_ports.each do |fwdport|
            results << [id, name, fwdport[1], fwdport[3], fwdport[2]]
          end
        end

        table = Terminal::Table.new :rows => results, :headings => ['machine.id', 'machine.name', 'forwarded_port_name', 'guest_port', 'host_port']
        @env.ui.info table.to_s

        # Success, exit status 0
        0
      end
    end
  end
end
