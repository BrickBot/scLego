package LegoDefs;

require EsterelSignal;
require ContactInput;
require MotorDirOutput;
require MotorSpeedOutput;
require LightInput;
require LightSensor;
require LightOutput;
require EsterelFunction;

require Exporter;
@ISA  = (Exporter);
@EXPORT =qw(true false %ValidInputs %ValidOutputs %ValidConstants %ValidFunctions);

sub true {
  return 1;
}

sub false {
  return 0;
}

# Valid input signal. Mapped onto Legos API. 
# Hash table. Values are signal objects.
#-------------------------------------------
%ValidInputs = ( 'TOUCH_1'      => ContactInput->new('TOUCH_1', 'pure', 'SENSOR_1'),
		 'TOUCH_2'      => ContactInput->new('TOUCH_2', 'pure', 'SENSOR_2'),
		 'TOUCH_3'      => ContactInput->new('TOUCH_3', 'pure', 'SENSOR_3'),
		 'LIGHT_LOW_1'  => LightInput->new('LIGHT_LOW_1', 
						   'pure', 
						   'SENSOR_1',
						   'LIGHT_1',
						   0,
						   true),
		 'LIGHT_HIGH_1' => LightInput->new('LIGHT_HIGH_1', 
						   'pure', 
						   'SENSOR_1',
						   'LIGHT_1',
						   0,
						   false),
		 'LIGHT_1_VALUE' => LightSensor->new('LIGHT_1_VALUE', 
						     'integer',
						     'SENSOR_1',
						     'LIGHT_1',
						     0),
		 'LIGHT_LOW_2'  => LightInput->new('LIGHT_LOW_2', 
						   'pure', 
						   'SENSOR_2',
						   'LIGHT_2',
						   1,
						   true),
		 'LIGHT_HIGH_2' => LightInput->new('LIGHT_HIGH_2', 
						   'pure', 
						   'SENSOR_2',
						   'LIGHT_2',
						   1,
						   false),
		 'LIGHT_2_VALUE' => LightSensor->new('LIGHT_2_VALUE', 
						     'integer',
						     'SENSOR_2',
						     'LIGHT_2',
						     1),
		 'LIGHT_LOW_3'  => LightInput->new('LIGHT_LOW_3', 
						   'pure', 
						   'SENSOR_3',
						   'LIGHT_3',
						   2,
						   true),
		 'LIGHT_HIGH_3' => LightInput->new('LIGHT_HIGH_3', 
						   'pure', 
						   'SENSOR_3',
						   'LIGHT_3',
						   2,
						   false),
		 'LIGHT_3_VALUE' => LightSensor->new('LIGHT_3_VALUE', 
						     'integer',
						     'SENSOR_3',
						     'LIGHT_3',
						     2)
	       );

# Valid output signal. Mapped onto Legos API
# Values are signal objects.
#-------------------------------------------
%ValidOutputs = ( 'MOTOR_A_DIR'   => MotorDirOutput->new('MOTOR_A_DIR', 'integer'),
		  'MOTOR_A_SPEED' => MotorSpeedOutput->new('MOTOR_A_SPEED', 
							   'integer'),
		  'MOTOR_B_DIR'   => MotorDirOutput->new('MOTOR_B_DIR', 'integer'),
		  'MOTOR_B_SPEED' => MotorSpeedOutput->new('MOTOR_B_SPEED', 
							   'integer'),
		  'MOTOR_C_DIR'   => MotorDirOutput->new('MOTOR_C_DIR', 'integer'),
		  'MOTOR_C_SPEED' => MotorSpeedOutput->new('MOTOR_C_SPEED', 
							   'integer'),
		  'CPUTS'         => EsterelOutput->new('CPUTS', 'string'),
		  'SET_LIGHT_1_THRESHHOLD' 
		      => LightOutput->new('SET_LIGHT_1_THRESHHOLD',
					  'integer',
					  0),
		  'SET_LIGHT_2_THRESHHOLD' 
		      => LightOutput->new('SET_LIGHT_2_THRESHHOLD',
					  'integer',
					  1),
		  'SET_LIGHT_3_THRESHHOLD' 
		      => LightOutput->new('SET_LIGHT_3_THRESHHOLD',
					  'integer',
					  2));

# Constants for motor direction
#------------------------------
%ValidConstants = (  MOTOR_OFF   	 	 => 0,
		     MOTOR_FWD   	 	 => 1,
		     MOTOR_REV   	 	 => 2,
		     MOTOR_BRAKE 	 	 => 3,
		     MAX_SPEED   	 	 => 255,
		     TICKS_PER_SECOND 	         => 100,
		     DEFAULT_LIGHT_THRESHHOLD    => 50
	     );

%ValidFunctions = ( CHANGE_MOTOR_DIR => EsterelFunction->new('CHANGE_MOTOR_DIR',
							     ['integer'],
							     'integer',
<<CODE,
integer CHANGE_MOTOR_DIR(val) 
integer val;
{
  switch (val) {
    case $ValidConstants{MOTOR_FWD}: 
      val = $ValidConstants{MOTOR_REV};
      break;
    case $ValidConstants{MOTOR_REV}: 
      val = $ValidConstants{MOTOR_FWD};
      break;
  }
  return val;
}
CODE
                                                            )
                  );

1;
