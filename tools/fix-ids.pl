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
Renumbers all <number/> tag values.

This script will parse the specification XML document and renumber all use cases
and requirements to begin at 1. All references (anchor links and requirements)
will be automatically updated with the new identifier number.

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

# Retrieve all unique identifiers.
my @id_nodes = $xpath->findnodes('//spec:number');
my @ids = ();

foreach my $node (@id_nodes) {
    push(@ids, $node->textContent);
}

# Find all references to the identifiers.
my %refs = ();

foreach my $node ($xpath->findnodes('//xhtml:a | //spec:reference')) {
    my $id = $node->textContent;

    if ($id =~ m/^(FR|NFR|UC)-\d+$/) {
        if (!exists($refs{$id})) {
            $refs{$id} = [];
        }

        push(@{$refs{$id}}, $node);
    }
}

# Map reset identifier numbers.
my %counter = ();
my %reset = ();

foreach my $id (@ids) {
    my ($prefix,) = split(/-/, $id);

    if (exists($counter{$prefix})) {
        $counter{$prefix}++;
    } else {
        $counter{$prefix} = 1;
    }

    $reset{$id} = $prefix . '-' . $counter{$prefix};
}

# Reset all unique identifiers.
foreach my $node (@id_nodes) {
    my $id = $node->textContent;

    $node->removeChildNodes();
    $node->appendText($reset{$id});
}

# Update all references.
foreach my $id (keys(%refs)) {
    foreach my $node (@{$refs{$id}}) {
        $node->removeChildNodes();
        $node->addChild(
            $doc->createTextNode($reset{$id})
        );

        if ('a' eq $node->localName) {
            $node->setAttribute(
                'href',
                '#' . $reset{$id}
            );
        }
    }
}

print $doc->toFile($FILE, 2);
