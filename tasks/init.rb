#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'open3'
require 'puppet'

def set(truefalse)
  cmd = ['puppet','config','set','--section','agent','noop',"#{truefalse}"]
  stdout, stderr, status = Open3.capture3(*cmd)
  raise Puppet::Error, _("stderr: ' #{stderr}') % { stderr: stderr }") if status != 0
  { status: stdout.strip }
  result = { 'result':"Set noop = #{truefalse} in puppet.conf" }
end

params = JSON.parse(STDIN.read)
truefalse = params['setting']

begin
  result = set(truefalse)
  puts result.to_json
  exit 0
rescue Puppet::Error => e
  puts({ status: 'failure', error: e.message }.to_json)
  exit 1
end
