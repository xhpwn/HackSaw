#!/usr/bin/env ruby

# HackSaw_v1.0 by bucket (Anubhav Saxena)
# For bucket's homebrew projects and security testing.

# Symmetric key substitution hash

system "clear"

#Initialize Hash and key variable.
symhash = {'a'=> 0, 'b'=> 1, 'c'=> 2, 'd'=> 3, 'e'=> 4, 'f'=> 5, 'g'=> 6,
           'h'=> 7, 'i'=> 8, 'j'=> 9, 'k'=> 10, 'l'=> 11, 'm'=> 12, 'n'=> 13,
           'o'=> 14, 'p'=> 15, 'q'=> 16, 'r'=> 17, 's'=> 18, 't'=> 19, 'u'=> 20,
           'v'=> 21, 'w'=> 22, 'x'=> 23, 'y'=> 24, 'z'=>25, ' '=> 26, '.'=> 27,
           '-'=> 28, '!'=> 29, '#'=> 30, '='=> 31, '['=> 32, ']' => 33}
userKey = 0

puts "> Project HackSaw_v1.0 by bucket (Anubhav Saxena)\n\n"
puts "> For bucket's homebrew projects and security testing.\n\n"
sleep(2)

# Check for existing encryption key in keys.txt.
print "> Checking for custom encryption key."
sleep(0.25)
$i = 0
begin
  print "."
  sleep(0.25)
  $i += 1;
end while $i < 5
puts "."
sleep(0.25)

if File::exists?("keys.txt")
  # Pulls existing encryption key from keys.txt
  rootFile = File.new("keys.txt", "r+")
  userKey = rootFile.sysread(3).to_i
  puts "\n> Found existing encryption key. (%d)\n\n" % [userKey]
  rootFile.close
else
  # Creates new keys.txt file with custom encryption key.
  File.open("keys.txt", "w") do |f|
    print "\n> No key found, enter new encryption key: "
    userKey = gets.chomp
    f.write(userKey)
    f.write("\n#DO NOT MODIFY!")
    puts "> New encryption key set. (%d)\n" % [userKey]
  end
end

sleep(1)

begin
puts "Select a process :"
puts "> 1. Start HackSaw Encryptor"
puts "> 2. Start HackSaw Decryptor"
puts "> 3. Change Encryption Key"
puts "> 4. Quit\n\n"
print "> Selector # : "

selector = gets.chomp

case selector
when "1"
  # bucket's HackSaw Algorithm Encryption
  puts "\nCustom encryption key set (%d)" % [userKey]
  sleep(1)
  puts "Paste string to encrypt :\n"
  toEncrypt = gets.chomp
  print "Encrypting String ."
  begin
    print "."
    sleep(0.25)
    $i += 1;
  end while $i < 8
  puts "."
  sleep(2)

  # Decryption algorithm using modular addition
  pointer = 0
  scanner = 0
  encryptedChar = ''
  encryptedString = ""
  begin
    finalChar = symhash[toEncrypt[pointer]] + userKey
    while finalChar > 33 do
    finalChar -= 33
    end
    symhash.each do |key, array|
      if array == finalChar
      encryptedChar = key
      end
    end
    encryptedString += encryptedChar
    pointer += 1
  end while pointer < toEncrypt.length
  puts "Encrypted String = %s" % [encryptedString]
  puts "\n"

when "2"
  # bucket's HackSaw Algorithm Decryption
  puts "\nCustom decryption key set (%d)" % [userKey]
  sleep(1)
  puts "Paste string to decrypt :\n"
  todecrypt = gets.chomp
  print "Decrypting String ."
  begin
    print "."
    sleep(0.25)
    $i += 1;
  end while $i < 11
  puts "."
  sleep(2)

  # Decryption algorithm using modular addition
  pointer = 0
  scanner = 0
  decryptedChar = ''
  decryptedString = ""
  begin
    finalChar = symhash[todecrypt[pointer]] - userKey
    if finalChar < 0
      finalChar = -finalChar
    end
    while finalChar > 33 do
    finalChar -= 33
    end
    symhash.each do |key, array|
      if array == finalChar
      decryptedChar = key
      end
    end
    decryptedString += decryptedChar
    pointer += 1
  end while pointer < todecrypt.length
  puts "Decrypted String = %s" % [decryptedString]
  puts "\n"

when "3"
  # Deletes old keys.txt and creates new file with custom encryption key.
  puts "Old encryption key (%d)" % [userKey]
  puts "Enter new encryption key: "
  userKey = gets.chomp
  File.open("keys.txt", "w") do |f|
  f.write(userKey)
  f.write("\n#DO NOT MODIFY!")
  end
  puts "New encryption key set (%d)" % [userKey]
  puts "\n"
end

# Quits HackSaw
end while selector != "4"

puts "Killing HackSaw."
sleep(1)
puts "Success."
