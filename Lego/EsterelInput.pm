# Esterel input signal class
#---------------------------
package EsterelInput;

require EsterelSignal;

@ISA = (EsterelSignal);

sub new {
  # args: input_name type Lego_sensor
  my $proto = shift;
  my $self = EsterelSignal->new($_[0], $_[1]);
  $self->{SENSOR} = $_[2];
  bless $self, $proto;
  return $self;
}

sub LegoSensor {
  my $self = shift;
  return $self->{SENSOR};
}

sub FunctionName {
  # Builds Esterel input function name
  my $self = shift;
  return $self->ModuleName() . '_I_' . $self->Name();
}

sub PrintInitialization {
  # nothing
}

sub PrintCall {
}
1;
