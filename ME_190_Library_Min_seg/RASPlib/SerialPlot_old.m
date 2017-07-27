function SerialPlot(COMport, DataType, NumSamples)

global datNumSamples NumSamples
% search for all instrument objects:
close all

% Ensure the com port is closed by closing all instrument objects:
CloseInstObjects

disp(['COMport: ' COMport ' DataType: ' DataType ' Number Samples:' num2str(NumSamples)]);
disp(' ');
disp(['-------------------- Opening ' COMport '  please wait up to 30 seconds ------------------'])
disp(' ');

%% Read from Serial:
s = serial(COMport);
set(s, 'ByteOrder', 'bigEndian');
set(s, 'BaudRate', 9600); 
% s.ReadAsyncMode = 'continuous';
% fprintf(s,'*IDN?')
% s.BytesAvailable
fopen(s);

d=fread(s, 1, DataType);
%% Read From file
% file='C:\adunin\Byte_Stream_SFunctions_Float_int16\dat.bin'
% s = fopen(file, 'r');

% initialize figure - it is faster to update
% figure data then replotting it each time
[fh, dh]=InitFig;

dat=[];
for k=1:1e5
    
    %% Read data
    % read a single data point
    % assume your computer can execute this loop faster than data is
    % sent to the seria port:
    d=fread(s,2,DataType);
    dat=[dat;d];
    
    %% Adjust the plotting data buffer:
    if(length(dat)>NumSamples)
        datNumSamples=(dat(end-NumSamples:end));
    else
        datNumSamples=dat;
    end
    
    %% handle figure activities:
    set(dh,'Xdata', 1:length(datNumSamples), 'Ydata',datNumSamples);
    drawnow
%     AutoScale
    if(AutoScalekeypress)
        AutoScale
        AutoScalekeypress=0;
    end
    if(stopkeypress),
        disp('Plotting Stopped - current data exported to variables FullDat and WindowDat in the workspace and saved to file')
        break;
    end
    
    % shift bytes read to try and sync data stream:
    if(byteadjustkeypress)
        disp('skipping a byte in an attempt to correct data');
        fread(s,1, 'uint8');
        byteadjustkeypress=0;
    end
    
end

save dat
assignin('base','FullDat',dat)
assignin('base', 'WindowDat',datNumSamples) 

try,
    fclose(s)
    delete(s)
    clear s
catch, end

end

function [fh, dh]=InitFig
%% initizlize a figure for plotting data:
fh=figure;

axes('Parent',fh,'FontSize',14);
set(fh,'toolbar','figure'); %stopkeypress=0;
assignin('caller','stopkeypress',0);
assignin('caller','byteadjustkeypress',0);
assignin('caller','AutoScalekeypress',0);


uicontrol('Style', 'pushbutton', 'String', 'Stop',...
    'Units','normalized','Position', [0 0 .1 .05],...
    'Callback', @stopbutton);
uicontrol('Style', 'pushbutton', 'String', 'Byte Adjust',...
    'Units','normalized','Position', [.1 0 .2 .05],...
    'Callback', @byteadjust);
uicontrol('Style', 'pushbutton', 'String', 'AutoScale',...
    'Units','normalized','Position', [.3 0 .2 .05],...
    'Callback', @AutoScaleButton);

dh=plot(0,0,'r','LineWidth',4);
ylim([-1 1]) % for x in mm
drawnow
end

function stopbutton(~, event)
% if the stop button is pressed
% assign stopkeypress high to stop taking data
assignin('caller','stopkeypress',1)
CloseInstObjects
end

function byteadjust(~, event)
% if the stop button is pressed
% assign stopkeypress high to stop taking data
assignin('caller','byteadjustkeypress',1)
end

function AutoScaleButton(~, event)
% if the stop button is pressed
% assign stopkeypress high to stop taking data
assignin('caller','AutoScalekeypress',1)
end

function CloseInstObjects
disp(' ');
disp('-- Closing all instrument objects --')
disp(' ');

newobjs=instrfindall
% Close them!
try,
    fclose(newobjs);
    delete(newobjs);
catch, end

end


function AutoScale
global datNumSamples NumSamples
if(max(datNumSamples) > 0  && min(datNumSamples) < max(datNumSamples) )
% disp('adj y axis')    
ylim([min(datNumSamples)-10 max(datNumSamples)+10])
end

end
