package Groonga::HTTP::Result;
use strict;
use warnings;
use Groonga::HTTP::Result::Select;
use Data::Dumper::Concise;

sub new {
    my $class = shift;
    my $self  = {@_};
    if ( $self->{command} and ( $self->{command} eq 'select' ) ) {
        return Groonga::HTTP::Result::Select->new( data => $self->{data} );
    }
    return bless $self, $class;
}

sub dump {
    my $self = shift;
    return Dumper $self->{data};
}

sub body {
    my $self = shift;
    return $self->{data}->[1];
}

1;
__END__
