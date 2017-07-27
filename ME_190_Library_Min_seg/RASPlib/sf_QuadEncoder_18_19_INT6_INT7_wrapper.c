/*
  *
  *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: 3.0 ---
  *
  *   This file is a wrapper S-function produced by the S-Function
  *   Builder which only recognizes certain fields.  Changes made
  *   outside these fields will be lost the next time the block is
  *   used to load, edit, and resave this file. This file will be overwritten
  *   by the S-function Builder block. If you want to edit this file by hand, 
  *   you must change it only in the area defined as:  
  *
  *        %%%-SFUNWIZ_wrapper_XXXXX_Changes_BEGIN 
  *            Your Changes go here
  *        %%%-SFUNWIZ_wrapper_XXXXXX_Changes_END
  *
  *   For better compatibility with the Simulink Coder, the
  *   "wrapper" S-function technique is used.  This is discussed
  *   in the Simulink Coder User's Manual in the Chapter titled,
  *   "Wrapper S-functions".
  *
  *   Created: Sat Mar  1 13:53:55 2014
  */


/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
# ifndef MATLAB_MEX_FILE

# include <Arduino.h>

typedef struct { int pinA; int pinB; int pos; int del;} Encoder;    
volatile Encoder Enc[3] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}};

/* auxiliary function to handle encoder attachment           */
int getIntNum(int pin) {
/* returns the interrupt number for a given interrupt pin 
   see http://arduino.cc/it/Reference/AttachInterrupt        */
switch(pin) {
  case 2:
    return 0;
  case 3:
    return 1;
  case 21:
    return 2;
  case 20:
    return 3;
  case 19:
    return 4;
  case 18:
    return 5;   
  default:
    return -1;
  }
}

/* auxiliary debouncing function                             */
void debounce(int del) {
  for (int k=0;k<del;k++) {
    /* can't use delay in the ISR so need to waste some time
       perfoming operations, this uses roughly 0.1ms on uno  */
    k = k +0.0 +0.0 -0.0 +3.0 -3.0;
  }
}

/* Interrupt Service Routine: change on pin A for Encoder 0  */
void irsPinAEn0(){

  /* read pin B right away                                   */
  int drB = digitalRead(Enc[0].pinB);
  
  /* possibly wait before reading pin A, then read it        */
  debounce(Enc[0].del);
  int drA = digitalRead(Enc[0].pinA);

  /* this updates the counter                                */
  if (drA == HIGH) {   /* low->high on A? */
      
    if (drB == LOW) {  /* check pin B */
  	Enc[0].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[0].pos--;  /* going counterclockwise: decrement  */
    }
    
  } else {                       /* must be high to low on A */
  
    if (drB == HIGH) { /* check pin B */
  	Enc[0].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[0].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update                                    */

} /* end ISR pin A Encoder 0                                 */



/* Interrupt Service Routine: change on pin B for Encoder 0  */
void isrPinBEn0(){ 

  /* read pin A right away                                   */
  int drA = digitalRead(Enc[0].pinA);
  
  /* possibly wait before reading pin B, then read it        */
  debounce(Enc[0].del);
  int drB = digitalRead(Enc[0].pinB);

  /* this updates the counter                                */
  if (drB == HIGH) {   /* low->high on B? */
  
    if (drA == HIGH) { /* check pin A */
  	Enc[0].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[0].pos--;  /* going counterclockwise: decrement  */
    }
  
  } else {                       /* must be high to low on B */
  
    if (drA == LOW) {  /* check pin A */
  	Enc[0].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[0].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update */

} /* end ISR pin B Encoder 0  */

/* Interrupt Service Routine: change on pin A for Encoder 1  */
void irsPinAEn1(){

  /* read pin B right away                                   */
  //int drB = digitalRead(Enc[0].pinB);  
  int PDE1=PINE;
  int drB = (PDE1 & 0x80)>>PINE7;//PINE7; (have to read whole port at once, then AND, then bitshift)
  
  /* possibly wait before reading pin A, then read it        */
  debounce(Enc[0].del);
  //int drA = digitalRead(Enc[0].pinA);
  PDE1=PINE;
  int drA = (PDE1 & 0x40)>>PINE6;//PINE6; (have to read whole port at once, then AND, then bitshift)
  
  /* this updates the counter                                */
  if (drA == HIGH) {   /* low->high on A? */
      
    if (drB == LOW) {  /* check pin B */
  	Enc[1].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[1].pos--;  /* going counterclockwise: decrement  */
    }
    
  } else {                       /* must be high to low on A */
  
    if (drB == HIGH) { /* check pin B */
  	Enc[1].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[1].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update                                    */
  
} /* end ISR pin A Encoder 1                                 */


/* Interrupt Service Routine: change on pin B for Encoder 1  */
void isrPinBEn1(){ 

  /* read pin A right away                                   */
  //int drA = digitalRead(Enc[0].pinA);
  int PDE1=PINE;
  int drA = (PDE1 & 0x40)>>PINE6;//PINE6; (have to read whole port at once, then AND, then bitshift)
  
  /* possibly wait before reading pin B, then read it        */
  debounce(Enc[0].del);
  //int drB = digitalRead(Enc[0].pinB);
  PDE1=PINE;
  int drB = (PDE1 & 0x80)>>PINE7;//PINE7; (have to read whole port at once, then AND, then bitshift)
  
  /* this updates the counter                                */
  if (drB == HIGH) {   /* low->high on B? */
  
    if (drA == HIGH) { /* check pin A */
  	Enc[1].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[1].pos--;  /* going counterclockwise: decrement  */
    }
  
  } else {                       /* must be high to low on B */
  
    if (drA == LOW) {  /* check pin A */
  	Enc[1].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[1].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update */

} /* end ISR pin B Encoder 1                                 */


/* Interrupt Service Routine: change on pin A for Encoder 2  */
void irsPinAEn2(){

  /* read pin B right away                                   */
  int drB = digitalRead(Enc[2].pinB);
  
  /* possibly wait before reading pin A, then read it        */
  debounce(Enc[2].del);
  int drA = digitalRead(Enc[2].pinA);

  /* this updates the counter                                */
  if (drA == HIGH) {   /* low->high on A? */
      
    if (drB == LOW) {  /* check pin B */
  	Enc[2].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[2].pos--;  /* going counterclockwise: decrement  */
    }
    
  } else { /* must be high to low on A                       */
  
    if (drB == HIGH) { /* check pin B */
  	Enc[2].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[2].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update                                    */

} /* end ISR pin A Encoder 2                                 */


/* Interrupt Service Routine: change on pin B for Encoder 2  */
void isrPinBEn2(){ 

  /* read pin A right away                                   */
  int drA = digitalRead(Enc[2].pinA);
  
  /* possibly wait before reading pin B, then read it        */
  debounce(Enc[2].del);
  int drB = digitalRead(Enc[2].pinB);

  /* this updates the counter                                */
  if (drB == HIGH) {   /* low->high on B? */
  
    if (drA == HIGH) { /* check pin A */
  	Enc[2].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[2].pos--;  /* going counterclockwise: decrement  */
    }
  
  } else { /* must be high to low on B                       */
  
    if (drA == LOW) {  /* check pin A */
  	Enc[2].pos++;  /* going clockwise: increment         */
    } else {
  	Enc[2].pos--;  /* going counterclockwise: decrement  */
    }
    
  } /* end counter update                                    */

} /* end ISR pin B Encoder 2                                 */


# endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void sf_QuadEncoder_18_19_INT6_INT7_Outputs_wrapper(int16_T *pos1,
                          int16_T *pos2 ,
			      const real_T  *xD,
                          const uint8_T  *enc, const int_T  p_width0, 
                          const uint8_T  *pinA, const int_T  p_width1, 
                          const uint8_T  *pinB, const int_T p_width2)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* wait until after initialization is done */
if (xD[0]==1) {
    
    /* don't do anything for mex file generation */
    # ifndef MATLAB_MEX_FILE
            
        /* get encoder position and set is as output */
        pos1[0]=Enc[enc[0]].pos;
        pos2[0]=Enc[enc[1]].pos;

    # endif
    
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
  * Updates function
  *
  */
void sf_QuadEncoder_18_19_INT6_INT7_Update_wrapper(const int16_T *pos1,
                          const int16_T *pos2 ,
                          real_T *xD, 
                          const uint8_T  *enc,  const int_T  p_width0,
                          const uint8_T  *pinA,  const int_T  p_width1,
                           const uint8_T *pinB, const int_T  p_width2)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if (xD[0]!=1) {
    
    /* don't do anything for mex file generation */
    # ifndef MATLAB_MEX_FILE
    
        /* enc[0] is the encoder number and it can be 0,1 or 2   */
        /* if other encoder blocks are present in the model      */
        /* up to a maximum of 3, they need to refer to a         */
        /* different encoder number                              */
            
        /* store pinA and pinB in global encoder structure Enc   */
        /* they will be needed later by the interrupt routine    */
        /* that will not be able to access s-function parameters */   

        Enc[enc[0]].pinA=pinA[0];      /* set pin A              */
        Enc[enc[0]].pinB=pinB[0];      /* set pin B              */
        Enc[enc[1]].pinA=pinA[1];      /* set pin A              */
        Enc[enc[1]].pinB=pinB[1];      /* set pin B              */
		
        /* set encoder pins as inputs                            */
        pinMode(Enc[enc[0]].pinA, INPUT); // 18
        pinMode(Enc[enc[0]].pinB, INPUT); // 19
        //pinMode(Enc[enc[1]].pinA, INPUT); 
        //pinMode(Enc[enc[1]].pinB, INPUT);
		// Set up PE6 and PE7 as inputs (INT6, INT7)
		DDRE &= 0x3F; //'B'00111111; binary 00111111  (pins 6 and 7 are inputs)
		
        
        /* turn on pullup resistors                              */
        digitalWrite(Enc[enc[0]].pinA, HIGH); 
        digitalWrite(Enc[enc[0]].pinB, HIGH); 
        //digitalWrite(Enc[enc[1]].pinA, HIGH); 
        //digitalWrite(Enc[enc[1]].pinB, HIGH); 
		PORTE |=0xC0; // 'B'11000000;  // Sets PE6 and PE7 HIGH
		
        /* attach interrupts                                     */
        switch(enc[0]) {
          case 0:
            attachInterrupt(getIntNum(Enc[0].pinA), irsPinAEn0, CHANGE);
            attachInterrupt(getIntNum(Enc[0].pinB), isrPinBEn0, CHANGE);
            break;  
          //case 1:
            //attachInterrupt(getIntNum(Enc[1].pinA), irsPinAEn1, CHANGE);
            //attachInterrupt(getIntNum(Enc[1].pinB), isrPinBEn1, CHANGE);
            //break;  
          case 2:
            attachInterrupt(getIntNum(Enc[2].pinA), irsPinAEn2, CHANGE);
            attachInterrupt(getIntNum(Enc[2].pinB), isrPinBEn2, CHANGE);
            break;  
          }
		// attach interrupts for enc[1]:
		attachInterrupt(6, irsPinAEn1, CHANGE);
        attachInterrupt(7, isrPinBEn1, CHANGE);

        # endif
    
    /* initialization done */ 
    xD[0]=1;
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
