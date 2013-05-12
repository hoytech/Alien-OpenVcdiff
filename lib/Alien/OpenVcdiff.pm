package Alien::OpenVcdiff;

our $VERSION = '0.100';

use parent 'Alien::Base';

use strict;

sub vcdiff_binary {
  my $dist_dir = Alien::OpenVcdiff->dist_dir();

  ## Installed in distribution auto/
  my $file = $dist_dir . '/bin/vcdiff';
  return $file if -f $file && -x $file;

  ## Built locally
  $file = $dist_dir . '/vcdiff';
  return $file if -f $file && -x $file;

  die "Unable to find vcdiff binary in " . $dist_dir;
}

1;




=head1 NAME

Alien::OpenVcdiff - Build and install Google's open-vcdiff delta encoding library

=head1 SYNOPSIS

    use Alien::OpenVcdiff;

    system(Alien::OpenVcdiff::vcdiff_binary() . " encode -dictionary file1 -target file2 -json");

=head1 DESCRIPTION

This package configures, builds, and installs Google's L<open-vcdiff|http://code.google.com/p/open-vcdiff/>. This library and its associated command-line utility C<vcdiff> implement L<RFC 3284|http://www.faqs.org/rfcs/rfc3284.html>, "The VCDIFF Generic Differencing and Compression Data". This RFC specifies a file format for delta encoding and can be thought of as a diff/patch equivalent for binary data (or any kind of data really).

The C<vcdiff> command-line utility binary's location can be found by calling C<Alien::OpenVcdiff::vcdiff_binary()> after the package has been loaded.

Although the binary might come in handy sometimes, the primary purpose of this module is to install the C<libvcdenc.so> and C<libvcddec.so> shared libraries so that they can be used by the L<Vcdiff> module.

=head1 SEE ALSO

L<Alien-OpenVcdiff github repo|https://github.com/hoytech/Alient-OpenVcdiff>

L<Vcdiff>

L<open-vcdiff|http://code.google.com/p/open-vcdiff/>

=head1 AUTHOR

Doug Hoyte, C<< <doug@hcsw.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2013 Doug Hoyte.

This module includes open-vcdiff which is copyright Google Inc and Lincoln Smith. open-vcdiff is licensed under the Apache 2.0 license which can be found in the included open-vcdiff distribution.

This module is licensed under the same terms as perl itself or under the Apache 2.0 license, whichever you prefer.
