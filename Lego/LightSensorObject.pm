# common part to Light objects
package LightSensorObject;
require EsterelInput;
@ISA = qw(EsterelInput);

sub new {
  # args: input_name type Lego_sensor value index
  my $proto = shift;
  my $self = EsterelInput->new(@_[0..2]);
  $self->{VALUE} = $_[3];
  $self->{INDEX} = $_[4];
  bless $self, $proto;
  return $self;
}

sub ThreshholdIndex {
  my $self = shift;
  return $self->{INDEX};
}

sub LightValue {
  my $self = shift;
  return $self->{VALUE};
}
1;
