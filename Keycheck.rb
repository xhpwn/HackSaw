class Keycheck

    def self.check()

    if File::exists?("key.txt")

        # Pulls existing encryption key from key.txt
        rootFile = File.new("key.txt", "r+")
        userKey = rootFile.sysread(128)
        rootFile.close
        sleep(1)

    else

        # Creates new key.txt file with custom encryption key
        puts "\nNo encryption key file found, generating new file."
        sleep(0.5)
        File.open("key.txt", "w") do |f|
        print "\nNew file generated."
        sleep(0.5)
        print "\n\nInput new encryption key : "
        userKey = gets.chomp
        f.write(userKey)
        puts "\nCustom encryption key written."
        sleep(0.5)
        end
    end

    return userKey

    end

end
