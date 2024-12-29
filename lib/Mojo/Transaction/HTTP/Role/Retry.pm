package Mojo::Transaction::HTTP::Role::Retry;

# ABSTRACT: Adds a retries attribute

use Mojo::Base -role;

=head1 SYNOPSIS

  use Mojo::Base -signatures;

  {
    use Mojolicious::Lite;
    my $ok = 0;
    get '/' => sub ($c) {
      return $ok++ ?
        $c->render(text => 'OK!') :
        $c->render(text => 'Not OK!', status => 429);
    };
  }

  my $ua = Mojo::UserAgent->with_roles('+Retry')->new;
  $ua->get(
    '/' => sub ($ua, $tx) {
      say $tx->retries; # 1
      Mojo::IOLoop->stop;
    }
  );
  Mojo::IOLoop->start;

=head1 DESCRIPTION

This role adds a C<retries> attribute to L<Mojo::Transaction::HTTP>.

=head1 ATTRIBUTES

=head2 retries

The number of retries that have been attempted.

=cut

has retries => 0;

1;

=head1 SEE ALSO

L<Mojo::UserAgent::Role::Retry>.

=cut
