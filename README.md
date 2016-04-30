# puppet-agent-step


The Puppet Agent Step Rundeck Plugin executes the 
[puppet agent](https://docs.puppetlabs.com/puppet/latest/reference/man/agent.html) 
command on each node matching the Job node filter.
The manifest file specified by the plugin is assumed to be present on the remote node.

The plugin can be configured to invoke the puppet command using sudo.
Also, the plugin allows you to pass any standard options to the puppet agent command.

## Plugin Type

This plugin is a [Rundeck](http://www.rundeck.org) Remote Node Step Script Plugin. Arguments are passed as parameters, so no special ssh setup for handling Rundeck environment variables is needed.

## Plugin Parameters

* Arguments: Optional arguments to pass to puppet run command (mostly --test).
* Sudo: Use sudo to run puppet (default: false)

## Verbose output

If the job invokes the plugin with loglevel==DEBUG, the plugin will echo the script before executing. For verbose puppet output set the --verbose flag in th
arguments.

## Build


    make

produces:

    puppet-agent-step.zip

...then,

    make install

Copies it to $RDECK_BASE/libext
