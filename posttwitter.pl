#!/usr/bin/perl

require Net::Twitter;
require LWP::UserAgent;

my $username = $ARGV[0];
my $password = $ARGV[1];

my $status = <>;

print $status;
my $twitter = new Net::Twitter(username => $username, password => $password);

$twitter->update($status);
