Graphical installation instructions are given in the included PDF.

Rensselaer Arduino Support Package - RASPlib installation Instructions:
Prerequisite: Arduino Support package for Simulink has been installed, Matlab 2012b or later. 
Unzip the contents and copy the “RASPlib” folder to your home Matlab directory:

1.	Obtain the latest version of the library. Unzip the contents and copy the “RASPlib” folder to your home Matlab directory:
- Open Matlab from the Matlab icon and it will start in the home directory:
- Type pwd after startup to get this directory path
- On windows computers it will look like C:\Users\userid\Documents\MATLAB

2.	The RASPlib should now be in your home MATLAB folder.  Also in the …\MATLAB folder you should find a file named “startup.m”.  If this does not exist create a file named “startup.m”.  This script is executed every time Matlab starts. 
 
3.	 Edit this file and add the path to the RASPlib folder using the command addpath:
addpath 'C:\Users\hurstjd\Documents\MATLAB\RASPlib'
Be sure to put single quotes around the path in case it contains spaces.

4.	Open Matlab, open the Simulink Library, then Right-Click “Rensselaer Arduino Support Package” and select “Open Rensselaer Arduino Support Package”
 
5.	Open the demo file for your particular hardware (if you have a generic hardware setup you can create a Simulink example using the one of the available blocks in the main library or adopt any of the provided device specific libraries blocks using the indicated pins).  The Mechatronics board is M1V4.
 
- After opening the Demo save it to your home directory with “save-as”.  From now on you can create Simulink diagrams in any location and just drag the blocks from the library since Matlab knows where all the necessary library files are.
- Right clock in the demo file and select “Model Configuration Parameters” to specify your COM port and setup the hardware.
- Run the demo on the hardware

