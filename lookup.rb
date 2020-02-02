def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

def parse_dns(dns_raw)
  # removing comments and empty line from dns_raw
  dns_raw = dns_raw.select { |line| line[0] != "#" && line[0] != "\n" }
  #  splitting records,domain,ip/alias domain and chomping any whitespace
  dns_raw_list = dns_raw.map { |line| line.chomp.split(", ") }

  dns_hash = {}
=begin
      structure of hash(Eg) :-

      dns_hash{
        :A => {
          "google.com" => "8.8.8.8"
        }
        :CNAME =>{
          "gmail.com" => "google.com"
        }
      }
=end
  dns_raw_list.each do |data|
    # if dns_hash has the record as a key already,insert domain name as key & ip/alias as value
    if dns_hash.has_key?(data[0].to_sym)
      dns_hash[data[0].to_sym][data[1]] = data[2]
    else
      # else create the record as a key and insert the domain name && ip/alias as hash(key, value) in the domain
      dns_hash[data[0].to_sym] = {}
      dns_hash[data[0].to_sym][data[1]] = data[2]
    end
  end
  return dns_hash
end

def resolve(dns_records, lookup_chain, domain)
  # if :A record contains domain -> return
  if dns_records[:A].has_key? (domain)
    lookup_chain.push(dns_records[:A][domain])
    return lookup_chain
    #if :CNAME record contains domain -> pass it's alias recursively to resolve
  elsif dns_records[:CNAME].has_key? (domain)
    lookup_chain.push(dns_records[:CNAME][domain])
    resolve(dns_records, lookup_chain, dns_records[:CNAME][domain])
    # if both :A and :CNAME do not contain domain -> mention the ERROR
  else
    puts "Error: record not found for #{domain}"
    exit
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
