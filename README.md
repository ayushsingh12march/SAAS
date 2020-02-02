# SAAS
# Assignment 1


Sample output for the above zone file:

$ ruby lookup.rb google.com
google.com => 172.217.163.46

$ ruby lookup.rb gmail.com
gmail.com => mail.google.com => google.com => 172.217.163.46

$ ruby lookup.rb gmil.com
Error: record not found for gmil.com
