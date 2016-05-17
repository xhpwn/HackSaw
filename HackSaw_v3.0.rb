#!/usr/bin/env ruby

# HackSaw_v3.0 by xhpwn | Anubhav Saxena |
# For homebrew projects and security testing.

system "clear"

puts "> Project HackSaw_3.0 by xhpwn | Anubhav Saxena |"
puts "> For homebrew projects and security testing."

sleep(1)

print "\n> Initializing "

$i = 0
begin
    print "."
    sleep(0.25)
    $i += 1;
end while $i < 5
puts "."

# Check for existing encryption key in key.txt

asciihash = {' ' => 0, '!' => 1, '"' => 2, '#' => 3, '$' => 4, '%' => 5,
             '&' => 6, '\'' => 7, '(' => 8, ')' => 9, '*' => 10, '+' => 11,
             ',' => 12, '-' => 13, '.' => 14, '/' => 15, '0' => 16, '1' => 17,
             '2' => 18, '3' => 19, '4' => 20, '5' => 21, '6' => 22, '7' => 23,
             '8' => 24, '9' => 25, ':' => 26, ';' => 27, '<' => 28, '=' => 29,
             '>' => 30, '?' => 31, '@' => 32, 'A' => 33, 'B' => 34, 'C' => 35,
             'D' => 36, 'E' => 37, 'F' => 38, 'G' => 39, 'H' => 40, 'I' => 41,
             'J' => 42, 'K' => 43, 'L' => 44, 'M' => 45, 'N' => 46, 'O' => 47,
             'P' => 48, 'Q' => 49, 'R' => 50, 'S' => 51, 'T' => 52, 'U' => 53,
             'V' => 54, 'W' => 55, 'X' => 56, 'Y' => 57, 'Z' => 58, '[' => 59,
             '\\' => 60, ']' => 61, '^' => 62, '_' => 63, '`' => 64, 'a' => 65,
             'b' => 66, 'c' => 67, 'd' => 68, 'e' => 69, 'f' => 70, 'g' => 71,
             'h' => 72, 'i' => 73, 'j' => 74, 'k' => 75, 'l' => 76, 'm' => 77,
             'n' => 78, 'o' => 79, 'p' => 80, 'q' => 81, 'r' => 82, 's' => 83,
             't' => 84, 'u' => 85, 'v' => 86, 'w' => 87, 'x' => 88, 'y' => 89,
             'z' => 90, '{' => 91, '|' => 92, '}' => 93, '~' => 94}

userKey = ""

# Encryption key check

if File::exists?("key.txt")

    # Pulls existing encryption key from key.txt
    rootFile = File.new("key.txt", "r+")
    userKey = rootFile.sysread(128)
    puts "\n> Found existing encryption key => %s" % [userKey]
    rootFile.close

else

    # Creates new key.txt file with custom encryption key
    puts "\n> No encryption key file found, generating new file."
    File.open("key.txt", "w") do |f|
    print "> New file generated."
    print "\n> Input new encryption key : "
    userKey = gets.chomp
    f.write(userKey)
    puts "\n> Custom encryption key written."
    end
end

sleep(1)

begin
puts "\n> Choose module :\n\n"
puts "> (1) HackSaw Encryptor"
puts "> (2) HackSaw Decryptor"
puts "> (3) Change Encryption Key"
puts "> (4) Kill HackSaw"
print "> Selector : "

modselector = gets.chomp

case modselector

when "1"
    # HackSaw Encryptor

    puts "\n> Fetching encryption key."
    sleep(1)
    puts "\n> Found user encryption key => %s" % [userKey]
    sleep(1)
    print "\n> Input string to encrypt : "
    toEncrypt = gets.chomp
    tempKey = userKey
    while toEncrypt.length > tempKey.length
        tempKey += tempKey
    end
    encryptedstring = ""
    for scraper in 0..toEncrypt.length - 1
        encrvalue = asciihash[toEncrypt[scraper]].to_i + asciihash[tempKey[scraper]].to_i
        while encrvalue > 94
            encrvalue -= 95
        end
        asciihash.each do |encrchar, charvalue|
            if encrvalue == asciihash[encrchar]
                encryptedstring += encrchar
            end
        end
    end
    puts "\nEncrypted String => %s" % [encryptedstring]

when "2"
    # HackSaw Decryptor

    puts "\n> Fetching encryption key."
    sleep(1)
    puts "\n> Found user encryption key : %s" % [userKey]
    sleep(1)
    print "\n> Input string to decrypt : "
    todecrypt = gets.chomp
    tempKey = userKey
    while todecrypt.length > tempKey.length
        tempKey += tempKey
    end
    decryptedstring = ""
    for scraper in 0..todecrypt.length - 1
        decrvalue = asciihash[todecrypt[scraper]].to_i - asciihash[tempKey[scraper]].to_i
        while decrvalue < 0
            decrvalue += 95
        end
        asciihash.each do |decrchar, dearvalue|
            if decrvalue == asciihash[decrchar]
                decryptedstring += decrchar
            end
        end
    end
    puts "\nDecrypted String => %s" % [decryptedstring]
    sleep(1)

when "3"
    # Change User Encryption Key
    puts "\nCurrent encryption key => %s" % [userKey]
    sleep(1)
    puts "\n> (1) Enter custom user encryption key"
    puts "> (2) Generate random user encryption key"
    print "> Selector : "
    changeselector = gets.chomp

        case changeselector
            when "1"
                File.open("key.txt", "w") do |f|
                print "\n> Input custom user encryption key : "
                sleep(1)
                userKey = gets.chomp
                f.write(userKey)
                puts "\n> Custom encryption key written."
                end
            
            when "2"
                File.open("key.txt", "w") do |f|
                userKey = ""
                print "\n> Generating random user encryption key."
                sleep(1)
                for counter in 0..127
                    randomvalue = rand(95)
                    asciihash.each do |key, value|
                        if randomvalue == asciihash[key]
                            userKey += key
                        end
                    end
                end
                f.write(userKey)
                puts "\n> Custom encryption key written."
                sleep(1)
            end
        end

end

end while modselector != "4"
# Quit script
puts "\n> Killing HackSaw."
sleep(1)
puts "\n> Success."
sleep(1)

system "clear"
