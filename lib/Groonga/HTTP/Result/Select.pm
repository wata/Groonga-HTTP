package Groonga::HTTP::Result::Select;
use strict;
use warnings;
use base qw(Groonga::HTTP::Result);

sub hit_num {
    my $self = shift;
    return $self->body->[0]->[0]->[0];
}

sub columns {
    my $self = shift;
    my @cols = ();
    if (ref $self->body eq 'ARRAY') {
        foreach my $col ( @{ $self->body->[0]->[1] } ) {
            push @cols, $col->[0];
        }
    }
    return \@cols;
}

sub items {
    my $self = shift;
    my $cols = $self->columns;
    my @item_array = ();
    if (ref $self->body eq 'ARRAY') {
        foreach my $i ( 2 .. int @{ $self->body->[0] } - 1 ) {
            my $row = $self->body->[0]->[$i];
            my $item;
            foreach my $j ( 0 .. int @$cols - 1 ) {
                my $key   = $cols->[$j];
                my $value = $row->[$j];
                $item->{$key} = $value;
            }
            push @item_array, $item;
        }
    }
    return \@item_array;
}

1;
__END__
