# vim: tabstop=2 shiftwidth=2 softtabstop=2

# Module: 'aimonb-systemd'
# Author: Aimon Bustardo <me at aimon dot net>

Puppet::Type.type(:systemctl).provide(:systemctl) do
  desc "Puppet Module for managing systemd services via systemctl"

  commands :systemctl => "/usr/bin/systemctl"

  def name
    resource[:name]
  end

  def enable
    resource[:enable]
  end

  def create
   # case resource[:command]
   # when 'enable', 'disable', 'start', 'stop', 'restart', 'try-restart', 'reload', 'reload-or-restart', 'reload-or-try-restart', 'mask', 'unmask'
   #   comm = resource[:command]
   # else
   #   raise Puppet::Error, "Command must be one of: 'enable', 'disable', 'start', 'stop', 'restart', 'try-restart', 'reload', 'reload-or-restart', 'reload-or-try-restart', 'mask', 'unmask'"
   # end
    begin
      comm = resource[:command]
      systemctl(comm, "#{name}")
    rescue Puppet::ExecutionFailure => e
      raise Puppet::Error, "Command failed with: #{e}"
    end
  end

  def exists?
    case resource[:command]
    when 'enable', 'disable'
      if resource[:command] == 'enable'
        return isenabled
      end
      return !isenabled
    when 'start', 'stop'
      if resource[:command] == 'start'
        return status
      end
      return !status
    when 'restart', 'try-restart', 'reload', 'reload-or-restart', 'reload-or-try-restart', 'mask', 'unmask'
      return false
    end
  end

  def self.isenabled?
    begin
      systemctl('is-enabled', "#{name}")
      return true
    rescue Puppet::ExecutionFailure => e
      return false
    end
  end
  
  def self.status?
    begin
      systemctl('status', "#{name}")
      return true
    rescue Puppet::ExecutionFailure => e
      return false
    end
  end
end
