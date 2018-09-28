# This fact simply reflects the value of "noop" in the agent's puppet.conf.

require 'puppet'

Facter.add(:puppet_conf_noop) do
  setcode do
    Puppet.settings['noop']
  end
end
