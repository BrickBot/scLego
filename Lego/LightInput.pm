# Esterel input signal for light input
#-------------------------------------
package LightInput;

require LightSensorObject;

@ISA = qw(LightSensorObject);

my % SensorInitialized = ();

sub new {
  # args: input_name type Lego_sensor value index boolean_low
  my $proto = shift;
  my $self = LightSensorObject->new(@_);
  $self->{IS_LOW} = $_[5];
  bless $self, $proto;
  return $self;
}

sub PrintCall {
  my $self = shift;
  local(*OUT) = shift;
  my $fnc = $self->FunctionName();
  my $value = $self->LightValue();
  my $index = $self->ThreshholdIndex();
  my $op = ($self->{IS_LOW} ? '<' : '>');
  print OUT <<C_CODE;
    if ( $value $op LIGHT_THRESHHOLD[$index] ) {
      $fnc();
    }
C_CODE
  ;
}

sub PrintInitialization {
  my $self = shift;
  local(*OUT) = shift;

  return if exists $SensorInitialized{$self->LegoSensor()};
  $SensorInitialized{$self->LegoSensor()} = 1;
  printf OUT "  ds_active(&%s);\n", $self->LegoSensor();
}
1;
