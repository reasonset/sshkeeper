#!/bin/env ruby
require 'timeout'

SSH_HOST = ARGV.shift

TIMEOUT_RECEIVE_LIMIT = 120
TIMEOUT_TOTAL_LIMIT = 120
PING_INTERVAL = 60
VERBOSE = false

abort "No host given" unless SSH_HOST

IO.popen(["ssh", SSH_HOST, "cat"], "w+") do |io|
  loop do
    Timeout.timeout(TIMEOUT_TOTAL_LIMIT) do
      io.puts "ping"
      Timeout.timeout(TIMEOUT_RECEIVE_LIMIT) do
        io.gets
        puts "pong" if VERBOSE
      end
    end
    sleep PING_INTERVAL
  end
end
