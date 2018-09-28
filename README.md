# `set_noop`

This cross-platform module consists of a task to manipulate the "noop" setting in an agent's puppet.conf, and a fact to report on the current "noop" setting in an agent's puppet.conf.

## Task

The `set_noop` task updates an agent's puppet.conf to manipulate the "noop" setting in the [agent] section.  For example, provided you've got SSH keys, host keys, bolt in your command path, and this module installed into your modulepath, setting nodes to noop mode is as simple as:

    bolt task run set_noop setting=true \
      --nodes ssh://bert,ssh://ernie

For more information on Bolt's configuration and command-line options, refer to [the Bolt online documentation](https://puppet.com/docs/bolt/0.x/bolt.html).

Here's a more thorough example of taking some Linux nodes out of noop mode, on Linux, prompting for the root user's password and ignoring SSH host key checks:

    bolt task run set_noop setting=false \
      --no-host-key-check --user root --password \
      --nodes ssh://waldorf,ssh://statler

Similarly, a thorough example of setting Windows nodes into noop mode, logging in as Administrator, prompting for password, and using a non-ssl transport:

    bolt task run set_noop setting=true \
      --no-ssl --user Administrator --password \
      --nodes winrm://kermit

This task will also become available in the Puppet Enterprise console, as soon as you install the module into your production environment.  (Add it to your Puppetfile.)

## Fact

The `puppet_conf_noop` fact reflects the current "noop" setting in a node's puppet.conf.  This is distinct from the built-in `clientnoop` fact, which reflects whether the current run is in noop mode, regardless of the puppet.conf setting.
