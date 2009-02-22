#!/usr/bin/perl

require Net::Twitter;
require LWP::UserAgent;

my $username = $ARGV[0];
my $password = $ARGV[1];
my $gender = $ARG[2] || 'F';

my $twitter = new Net::Twitter(username => $username, password => $password);

my $ua = LWP::UserAgent->new;
$ua->timeout(10);

my $response = $ua->post('http://www.generatus.com/AJAXStatus.asp?N=&G=' . $gender . '&k=');

if ($response->is_success) {
     $raw = $response->decoded_content;  # or whatever
 }
 else {
     die $response->status_line;
 }

my @bits = split(/\#\#\#/, $raw);


my $status = $bits[0];
chomp $status;	
#print "tweeting: \"\@$username$status\"\n";
$twitter->update($status);
