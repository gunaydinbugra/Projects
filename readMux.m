clear all
clc 

a = arduino('com4', 'mega2560');
x = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
for channel = 1:16
 %   SIG_pin = readVoltage(a,'A0')*1024/5;

    muxChannel = [0 0 0 0;
              1 0 0 0;
              0 1 0 0;
              1 1 0 0;
              0 0 1 0;
              1 0 1 0;
              0 1 1 0;
              1 1 1 0;
              0 0 0 1;
              1 0 0 1;
              0 1 0 1;
              1 1 0 1;
              0 0 1 1;
              1 0 1 1;
              0 1 1 1;
              1 1 1 1];
          b1=muxChannel(channel,1);
          b2=muxChannel(channel,2);
          b3=muxChannel(channel,3);
          b4=muxChannel(channel,4);
        
    writeDigitalPin(a,'D8',b1);
    writeDigitalPin(a,'D9',b2);
    writeDigitalPin(a,'D10',b3);
    writeDigitalPin(a,'D11',b4);
    
    x(channel) = readVoltage(a,'A0')*1024/5;
end


      
  