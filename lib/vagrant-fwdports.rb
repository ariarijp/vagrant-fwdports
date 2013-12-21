require "vagrant-fwdports/version"
require "vagrant-fwdports/plugin"

module VagrantPlugins
  module FwdPorts
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end

