#!/usr/bin/env perl

# Load modules.
use Carp;
use File::Basename qw(basename);
use strict;
use XML::LibXML;

# Know thyself.
my $SELF = basename($0);

# Get arguments.
my $FILE = $ARGV[0];

if ('' eq $FILE) {
    print STDERR <<"HELP";
Usage: $SELF FILE
Displays the next available number.

This script will parse the specification XML document and display a list of
numbers that can be used next. This is useful if you re-order use cases and
requirements and have trouble tracking what the next available number is.

FILE
  The path to the specification XML file.
HELP
    exit(0);
}

# Parse the specification.
my $doc = XML::LibXML->load_xml(location => $FILE);

# Make it possible to search our namespace.
my $xpath = XML::LibXML::XPathContext->new($doc);

$xpath->registerNs('spec', 'urn:kherge:specification');
$xpath->registerNs('xhtml', 'http://www.w3.org/1999/xhtml');

# Retrieve the highest value for any number.
my %numbers = ();

foreach my $node ($xpath->findnodes('//spec:number')) {
    my ($prefix, $number) = split(/-/, $node->textContent, 2);

    if (exists($numbers{$prefix})) {
        $numbers{$prefix} = $number if ($number > $numbers{$prefix});
    } else {
        $numbers{$prefix} = $number;
    }
}

# Display the next numbers.
foreach my $prefix (sort(keys(%numbers))) {
    printf "Next %3s: %d\n", $prefix, $numbers{$prefix} + 1;
}
