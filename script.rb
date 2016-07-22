#!/usr/bin/env ruby

=begin
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    +                                                                   +
    +    HackSaw                                                        +
    +    @author Anubhav Saxena, http://saxena.xyz                      +
    +    @desc The Encryption Project.                                  +
    +                                                                   +
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
=end

require_relative 'Graphics'
require_relative 'Keycheck'
require_relative 'Encryptor'
require_relative 'Decryptor'
require_relative 'Changekey'

# Startup Graphics
system "clear"
Graphics.Watermark()
Graphics.Loadgraphic()

userKey = ""

userKey = Keycheck.check()

puts "\nFound existing encryption key => %s" % [userKey]

# Encryption key check

begin
puts "\nChoose module :\n\n"
puts "(1) HackSaw Encryptor"
puts "(2) HackSaw Decryptor"
puts "(3) Change Encryption Key"
puts "(4) Kill HackSaw"
print "Selector : "

modselector = gets.chomp

case modselector

when "1"
    
    # HackSaw Encryptor
    Encryptor.encrypt(userKey)

when "2"

    # HackSaw Decryptor
    Decryptor.decrypt(userKey)

when "3"

    # Change User Encryption Key
    Changekey.change(userKey)

end

end while modselector != "4"

# Quit

puts "\n> Killing HackSaw."
sleep(1)
puts "\n> Success."
sleep(1)

system "clear"
