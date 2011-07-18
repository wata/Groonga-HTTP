package Groonga::HTTP::Result;
use strict;
use warnings;
use Data::Dumper::Concise;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub dump {
    my $self = shift;
    return Dumper $self->{data};
}

sub body {
    my $self = shift;
    return $self->{data}[1];
}

1;
__END__
