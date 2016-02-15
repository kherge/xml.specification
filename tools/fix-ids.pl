#!/usr/bin/env perl

# Load modules.
use Carp;
use strict;

# Get arguments.
my $FILE = $ARGV[0];

# Make sure input file exists.
croak("$FILE: No such file") if (!-f $FILE);

# Read the entire file.
croak("$FILE: $!") unless (open(FILE, '<', $FILE));

my $contents = join('', <FILE>);

close(FILE);

# Match all unique identifiers.
my @ids = ($contents =~ m{<number>([^<]+)</number>}g);

# Reset identifiers.
my %counters = ();
my %reset = ();

for my $id (@ids) {
    my ($prefix) = ($id =~ m/^([^-]+-)/);

    if (exists($counters{$prefix})) {
        $counters{$prefix}++;
    } else {
        $counters{$prefix} = 1;
    }

    $reset{$id} = $prefix . $counters{$prefix};
}

# Replace all identifier instances.
for my $id (keys(%reset)) {

    # Replace unique identifier.
    $contents =~ s|<number>$id</number>|<number>$reset{$id}</number>|;

    # Replace all references.
    $contents =~ s|<reference>$id</reference>|<reference>$reset{$id}</reference>|g;

    # Replace all anchor links.
    $contents =~ s|<(([^:]+:)?a) (([^:]+:)?href)="#$id">$id</\1>|<$1 $3="$reset{$id}">$reset{$id}</$1>|g;

}

# Replace file contents.
croak("$FILE: $!") unless (open(FILE, '>', $FILE));

print FILE $contents;

close(FILE);
