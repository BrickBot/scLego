# Specialized output for motor direction
package MotorDirOutput;
require EsterelOutput;

@ISA = (EsterelOutput);
sub new {
  # args: name type
  my $proto = shift;
  my $self = EsterelOutput->new(@_);
  bless $self, $proto
}

sub PrintCode {
  my $self = shift;
  $self->SUPER::PrintCode(@_);
}
1;
