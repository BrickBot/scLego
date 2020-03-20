package EsterelFunction;
use EsterelType;

sub new {
  my $proto = shift;
  my $self = {};
  $self->{NAME} = shift;
  $self->{ARGS} = shift;
  $self->{TYPE} = shift;
  $self->{CODE} = shift;
  bless $self, $proto;
  return $self;
}

sub Name {
  my $self = shift;
  return $self->{NAME};
}

sub Args {
  my $self = shift;
  return $self->{ARGS};
}


sub Type {
  my $self = shift;
  return $self->{TYPE};
}

sub Check {
  my($self, $fnc, $args, $type) = @_;

 CHECK: {
    last CHECK if ( GetType($type) ne $self->Type() );
    last CHECK if (@$args != @{$self->Args()});
    for (my $i = 0; $i < @$args; $i++) {
      last CHECK if GetType($args->[i]) ne $self->Args()->[$i];
    }
    return 1;
  }
  my $str_args = 
  warn("*** Bad function prototype. Must be:\n    ",
       $self->Name(), '(', (join (', ', @{$self->Args()})), ') : ',
       $self->Type(), "\n");

  return 0;
}

sub PrintCode {
  my $self = shift;
  local(*OUT) = shift;
  print OUT $self->{CODE};
}
1;
