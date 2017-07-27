int powerSource    = 11; // we will use a digital pin to power the rc circuit.
int filteredSignal = A5;
int rawSignal   =    A4;
long milliseconds = 0;
int moisturevalue  = 0;
int capacitorvalue = 0;
unsigned long Start_Time = 0;
unsigned long End_Time = 20000; 

void setup() 
{
digitalWrite(powerSource,HIGH); //this will output almost 5v to the circuit.

Serial.begin(9600);
Serial.print("Time");
Serial.print("    ");
Serial.print("moistureVoltage");
Serial.print("    ");
Serial.print("capacitorVoltage");
Serial.print("    ");
Serial.println();
}
void loop(){ 
milliseconds = millis();
if (milliseconds < End_Time)
{
int moisturevalue = analogRead(rawSignal);
float moisturevoltage = moisturevalue*(5/1023.0);
int capacitorvalue = analogRead(filteredSignal);
float capacitorvoltage = capacitorvalue*(5/1023.0); 
  Serial.print(milliseconds);
  Serial.print("\t\t");
  Serial.print(moisturevoltage);
  Serial.print("\t\t\t");
  Serial.print(capacitorvoltage);
  Serial.println(); 
}}
