package Groonga::HTTP;
use strict;
use warnings;
our $VERSION = '0.01';
use Groonga::HTTP::Result;
use URI;
use Furl::HTTP;
use JSON;

sub new {
    my $class = shift;
    my %args  = @_;

    my $self  = {
        ua   => Furl::HTTP->new,
        host => $args{host} || 'localhost',
        port => $args{port} || 10041,
    };

    return bless $self, $class;
}

sub call {
    my $self     = shift;
    my $command  = shift;
    my $args_ref = shift;

    if ( $command eq 'load' && $args_ref->{values} ) {
        $args_ref->{values} = encode_json($args_ref->{values});
    }

    my $uri = URI->new('d/' . $command);
    $uri->scheme('http');
    $uri->host($self->{host});
    $uri->port($self->{port});
    $uri->query_form(%$args_ref);
    my ( undef, $code, undef, undef, $body ) = $self->{ua}->get($uri);

    if ( $code eq 200 ) {
        print $body, "\n";
        return Groonga::HTTP::Result->new( data => decode_json($body) );
    }
    else {
        die $code;
    }
}

1;
__END__

=head1 NAME

Groonga::HTTP -

=head1 SYNOPSIS

  use Groonga::HTTP;
  my $groonga = Groonga::HTTP->new;
  my $load_data = [
      { _key => "http://example.org/", title => "This is test record 1!" },
      { _key => "http://example.net/", title => "test record 2." },
      ...
  ];
  $groonga->call( load => { table => 'Site', values => $load_data } );
  # [[0,1308820931.65233,2.210007023],9]

=head1 DESCRIPTION

Groonga::HTTP is

=head1 AUTHOR

Wataru Nagasawa E<lt>nagasawa {at} junkapp.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
