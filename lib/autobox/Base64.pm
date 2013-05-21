package autobox::Base64;

# ABSTRACT: Convert strings to and from base64 easily

use v5.10;
use strict;
use warnings;
use utf8;

use parent 'autobox';

sub import { shift->SUPER::import(STRING => 'autobox::Base64::STRING') }

=head1 SYNOPSIS

    use autobox::Base64;

    my $encode = 'la la la'->encode_base64;      # bGEgbGEgbGE=
    my $decode = 'bGEgbGEgbGE='->decode_base64;  # la la la

=head1 DESCRIPTION

Pretty simple -- just provides autobox methods to strings that work in the way
you expect.

=head1 STRING METHODS

=head2 encode_base64

This method behaves the same as L<MIME::Base64/encode_base64>.

=head2 decode_base64

This method behaves the same as L<MIME::Base64/decode_base64>.

=head1 SEE ALSO

autobox

autobox::Core

autobox::JSON

MIME::Base64

=cut

{
    package autobox::Base64::STRING;
    use strict;
    use warnings;
    use utf8;

    use MIME::Base64 ();

    sub decode_base64 { MIME::Base64::decode_base64(shift) }
    sub from_base64   { goto \&decode_base64               }

    sub encode_base64 { MIME::Base64::encode_base64(shift, shift // undef) }
    sub to_base64     { goto \&encode_base64                               }
}

!!42;
