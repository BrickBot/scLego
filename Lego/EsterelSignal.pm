package EsterelSignal;

# Module name and accessors. Static member
my $ModuleName = undef;

sub SetModuleName {
  shift;
  $ModuleName = shift unless defined $ModuleName;
}

sub ModuleName {
  return $ModuleName;
}

# constructor
sub new {
  # args: name type
  my $proto = shift;
  my $self = {};
  $self->{NAME} = shift;
  $self->{TYPE} = shift;
  $self->{VARIDX} = undef;
  bless $self, $proto;
  return $self;
}

sub Name {
  my $self = shift;
  return $self->{NAME};
}

sub Type {
  my $self = shift;
  return $self->{TYPE};
}


sub SetVarIndex {
  my $self = shift;
  $self->{VARIDX} = shift;
}

sub VarIndex {
  my $self = shift;
  return $self->{VARIDX};
}

# Check type. 
# argument : ref array of variable types
sub CheckType {
  my $self = shift;
  my $var_to_type = shift;

 ERROR: {
    if ( $self->Type() eq 'pure' ) {
      last ERROR if defined ($self->VarIndex())
    }
    else {
      last ERROR if $self->Type() ne $var_to_type->[$self->VarIndex()];
    }
    return 0;
  }

  warn('*** signal ', $self->Name(), ' must be ', $self->Type(), "\n");
  return 1;
}

sub PrintCode {
}
1;
