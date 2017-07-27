
double PosRef = 0;
double Pos = 0;
double Error = 0;
double Error_dot = 0;
double Error_int = 0;
double Control_U = 0;
double Control_U_max = 255;
double Control_U_min = 0;

double KP = 0;
double KI = 0;
double KD = 0;

double Delta_t = 0;

double Error_filt = 0;
double Error_filt_prev = 0;
double alpha = 0.9;

unsigned long time_cur = 0;
unsigned long time_prev = 0;

double Poten2Meter = (5.0/1023.0)*0.01;
double Sense2Meter = (5.0/1023.0)*0.015;

void setup() {
  Serial.begin(9600);
  delay(1000);
  time_prev = millis();
}

void loop() {
   
   delay(5);                             // For slowing down the sampling rate if it is too fast 
   
   PosRef = analogRead(1)*Poten2Meter;   // Read reference command from the potentiometer and convert it to meters
   Pos = analogRead(2)*Sense2Meter;      // Read sensor output and convert it to meters
 
   Error = PosRef-Pos;                  // Feedback Error
   
   Error_filt = Error_filt * alpha + Error * (1-alpha);  // Filter the error for derivative calculation if the signal is noisy

   time_cur = millis();
   Delta_t = time_cur - time_prev;     // Calculate Delta_t
   
   Error_dot = (Error_filt-Error_filt_prev)/Delta_t;     // Calculate Error derivative
   
   Error_int = Error_int + Error*Delta_t;                // Calculate Error integral

   Control_U = KP*Error + KI*Error_int + KD*Error_dot;   // Compute the control signal

   if (Control_U > Control_U_max)
   { 
      Control_U = Control_U_max;              // Control saturation
      Error_int = Error_int - Error*Delta_t;  // Integrtor anti-windup (prevent error integrator from winding up)
   }
   
   if (Control_U < Control_U_min)
   { 
      Control_U = Control_U_min;              // Control saturation
      Error_int = Error_int - Error*Delta_t;  // Integrtor anti-windup (prevent error integrator from winding up)
   }
  
   analogWrite(1,floor(Control_U));   // Apply the control signal to actuator through PWM at pin#1

   Error_filt_prev = Error_filt;
   time_prev = time_cur;

   Serial.print(time_cur/1000);   // Prints time in seconds
   Serial.print("\t");            // Prints a tab

   Serial.print(PosRef);
   Serial.print("\t");

   Serial.print(Pos);
   Serial.print("\t");

   Serial.println(Control_U);
   
}
