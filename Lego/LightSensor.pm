# Esterel input signal for light sensor
#--------------------------------------
package LightSensor;
require LightSensorObject;

@ISA = qw(LightSensorObject);

sub new {
  # args: input_name type Lego_sensor value index
  my $proto = shift;
  my $self = LightSensorObject->new(@_);
  bless $self, $proto;
  return $self;
}

sub FunctionName {
  # Builds Esterel sensor function name
  my $self = shift;
  return $self->ModuleName() . '_S_' . $self->Name();
}


sub PrintCode {
  my $self = shift;
  local(*OUT) = shift;
  my $fnc = $self->FunctionName();
  my $value = $self->LightValue();
  my $type = $self->Type();
  print OUT <<C_CODE;
$type $fnc() {
  return $value;
}
C_CODE
  ;
}

1;
