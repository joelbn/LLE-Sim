%% SIMULATION TIMES
SimStart = 0;
SimStop = 6;
%load('ExoskeletonPositions.mat')
%% INTERPOLATION OF JOINT DATA
close all;
%Load Digitised data
MakHipAng = [0.0136674000000000,83.4700000000000;0.226879000000000,83.4600000000000;
    0.265148000000000,83.4600000000000;0.494761000000000,83.3800000000000;
    0.530296000000000,83.3800000000000;0.623235000000000,83.3800000000000;
    0.653303000000000,82.8900000000000;0.754442000000000,82.8900000000000;
    0.789977000000000,82.8900000000000;1.01139000000000,82.8900000000000;
    1.05513000000000,82.8900000000000;1.27107000000000,82.8900000000000;
    1.31207000000000,82.8900000000000;1.53622000000000,82.8800000000000;
    1.57175000000000,83.3700000000000;1.64282000000000,83.4500000000000;
    1.66196000000000,83.8500000000000;1.70296000000000,83.8500000000000;
    1.77403000000000,85.3800000000000;1.80683000000000,86.0200000000000;
    1.86697000000000,87.8800000000000;1.91344000000000,89.6500000000000;
    1.93257000000000,91.3400000000000;1.94624000000000,92.3100000000000;
    1.97084000000000,94.0100000000000;2.02278000000000,97.5500000000000;
    2.03098000000000,98.5200000000000;2.04191000000000,99.6500000000000;
    2.09112000000000,103;2.10478000000000,105.500000000000;
    2.11572000000000,106.800000000000;2.13759000000000,108.900000000000;
    2.18132000000000,111.800000000000;2.19226000000000,113;
    2.20046000000000,114.500000000000;
    2.21139000000000,116.700000000000;2.25239000000000,118.700000000000;
    2.26606000000000,120.700000000000;2.29613000000000,123.200000000000;
    2.32346000000000,124.300000000000;2.34806000000000,125.400000000000;
    2.36720000000000,126.300000000000;2.38907000000000,127.100000000000;
    2.42460000000000,127.200000000000;2.45740000000000,126.800000000000;
    2.50934000000000,125.600000000000;2.56948000000000,122.500000000000;
    2.60228000000000,121.600000000000;2.69795000000000,116.300000000000;
    2.71708000000000,115;2.81822000000000,109;2.87289000000000,105.500000000000;
    2.93850000000000,102.500000000000;2.95490000000000,101.400000000000;
    3.02597000000000,98.3500000000000;3.08064000000000,96.0100000000000;
    3.14897000000000,93.9100000000000;3.22278000000000,92.0500000000000;
    3.29932000000000,90.6000000000000;3.37585000000000,89.3900000000000;
    3.44692000000000,87.9400000000000;3.48246000000000,87.2900000000000;
    3.51253000000000,86.4900000000000;3.58907000000000,84.8700000000000;
    3.70114000000000,84.0600000000000;3.79408000000000,83.7400000000000;
    3.95809000000000,83.4100000000000;3.99636000000000,83.0900000000000;
    4.21777000000000,82.8500000000000;4.25330000000000,82.8500000000000;
    4.48292000000000,82.8400000000000;4.51845000000000,82.7600000000000;
    4.74260000000000,82.8400000000000;4.94761000000000,82.8400000000000;
    4.99954000000000,82.2700000000000;5.04055000000000,82.2700000000000;
    5.26469000000000,82.2700000000000;5.30023000000000,82.2700000000000;
    5.52437000000000,82.3500000000000;5.56811000000000,82.2600000000000;
    5.79226000000000,82.3400000000000;5.83052000000000,82.3400000000000;
    6.06014000000000,82.3400000000000;6.09021000000000,82.3400000000000
    ;6.31708000000000,82.3300000000000;6.35535000000000,82.2500000000000;
    6.38815000000000,82.2500000000000;6.41276000000000,82.8200000000000;
    6.56856000000000,82.8100000000000;6.61230000000000,82.8100000000000;
    6.83371000000000,82.8100000000000;6.86651000000000,82.8100000000000;
    6.93485000000000,82.8100000000000];

MakKneeAng = [0,15.1600000000000;0.101140000000000,15.3200000000000;
    0.423690000000000,15.4800000000000;
    0.699770000000000,15.4700000000000;1.01690000000000,15.4700000000000;
    1.39950000000000,15.3800000000000;1.44600000000000,14.9800000000000;
    2.01180000000000,14.9700000000000;2.08560000000000,15.4600000000000;
    2.16220000000000,16.3400000000000;2.22230000000000,18.7600000000000;
    2.28790000000000,21.2600000000000;2.35900000000000,23.7600000000000;
    2.38630000000000,26.5800000000000;2.47380000000000,31.1800000000000;
    2.53940000000000,36.0100000000000;2.55580000000000,37.7100000000000;
    2.58860000000000,39.4800000000000;2.61590000000000,42.3000000000000;
    2.63780000000000,45.1300000000000;2.67330000000000,47.4600000000000;
    2.68970000000000,49.7200000000000;2.71160000000000,52.3000000000000;
    2.73080000000000,54.8000000000000;2.76900000000000,57.2200000000000;
    2.79910000000000,61.1700000000000;2.85100000000000,65.7700000000000;
    2.88380000000000,68.9900000000000;2.92210000000000,71.8200000000000;
    2.95490000000000,74.9600000000000;2.99590000000000,77.6200000000000;
    3.03690000000000,80.2800000000000;3.06970000000000,82.3000000000000;
    3.09430000000000,83.1000000000000;3.10800000000000,84.6400000000000;
    3.12980000000000,86.2500000000000;3.15170000000000,87.3800000000000;
    3.20090000000000,88.9900000000000;3.21460000000000,90.2800000000000;
    3.24740000000000,91.5700000000000;3.29660000000000,92.8600000000000;
    3.33760000000000,93.6600000000000;3.38130000000000,94.5500000000000;
    3.43870000000000,94.7100000000000;3.50710000000000,96.1600000000000;
    3.64920000000000,98.3400000000000;3.79680000000000,98.7400000000000;
    3.94440000000000,98.9000000000000;4.07020000000000,99.1400000000000;
    4.17400000000000,99.4600000000000;4.32160000000000,99.4600000000000;
    4.49930000000000,99.4600000000000;4.69890000000000,99.4500000000000;
    4.85190000000000,99.4500000000000;4.93940000000000,99.4500000000000;
    4.96670000000000,99.7700000000000;5.27560000000000,99.9300000000000;
    5.31120000000000,99.6100000000000;5.37130000000000,99.6100000000000;
    5.40960000000000,99.8500000000000;5.50520000000000,100.200000000000;
    5.72390000000000,100.400000000000;5.92350000000000,100.500000000000;
    6.04370000000000,100.400000000000;6.09570000000000,100;
    6.42100000000000,99.7500000000000;6.53300000000000,99.4300000000000;
    6.82280000000000,99.4200000000000;6.89660000000000,99.9100000000000;
    6.98680000000000,100.100000000000];

MakAnkleAng = [0,100.300000000000;0.0820046000000000,100.400000000000;
    0.240547000000000,100.500000000000;0.522096000000000,100.500000000000;
    0.609567000000000,100.500000000000;0.811845000000000,100.500000000000;
    1.06879000000000,100.500000000000;1.58269000000000,100.500000000000;
    1.60456000000000,100.100000000000;1.68109000000000,99.9000000000000;
    1.70843000000000,100.300000000000;2.00364000000000,100.500000000000;
    2.08565000000000,101.200000000000;2.17039000000000,102.100000000000;
    2.22506000000000,102.600000000000;2.27973000000000,103.600000000000;
    2.31253000000000,104.200000000000;2.33986000000000,105;
    2.36173000000000,105.900000000000;2.39727000000000,107.400000000000;
    2.43007000000000,108.400000000000;2.47107000000000,109.500000000000;
    2.50387000000000,110.400000000000;2.57768000000000,110.900000000000;
    2.63781000000000,110.900000000000;2.71708000000000,109.600000000000;
    2.73622000000000,109.400000000000;2.77449000000000,109.200000000000;
    2.82916000000000,108.100000000000;2.89203000000000,106.400000000000;
    2.92483000000000,106.300000000000;2.96036000000000,105.200000000000;
    2.99317000000000,104.800000000000;3.02323000000000,104.200000000000;
    3.06697000000000,103.700000000000;3.16538000000000,101.600000000000;
    3.23645000000000,100.700000000000;3.31845000000000,100.200000000000;
    3.35672000000000,99.8700000000000;3.40319000000000,100.300000000000;
    3.54533000000000,100.300000000000;3.56446000000000,99.7900000000000;
    3.64920000000000,99.8700000000000;3.71754000000000,99.3900000000000;
    3.81868000000000,99.3000000000000;3.89522000000000,99.3000000000000;
    4.06743000000000,99.1400000000000;4.11390000000000,99.7000000000000;
    4.24784000000000,99.7800000000000;4.35991000000000,99.7800000000000;
    4.93941000000000,99.6100000000000;4.98041000000000,100.300000000000;
    5.28383000000000,100.100000000000;5.30569000000000,99.8500000000000;
    5.36583000000000,99.8500000000000;5.38770000000000,100.300000000000;
    5.48884000000000,100.300000000000;5.52984000000000,100.900000000000;
    6.07107000000000,100.700000000000;6.09294000000000,100.200000000000;
    6.42642000000000,100.100000000000;6.44829000000000,99.8300000000000;
    6.82005000000000,99.9100000000000;6.98952000000000,99.8300000000000];

%INTERPOLATE VECTORS
digh = MakHipAng';
x = digh(1,:);
y = digh(2,:);
xq = 0:0.001:6.99;
yq = interp1(x,y,xq,'spline');
hipangles(1,:) = xq;
hipangles(2,:) = yq ;

digk = MakKneeAng';
x = digk(1,:);
y = digk(2,:);
xq = 0:0.001:6.99;
yq = interp1(x,y,xq,'spline');
kneeangles(1,:) = xq;
kneeangles(2,:) = yq;

diga = MakAnkleAng';
x = diga(1,:);
y = diga(2,:);
xq = 0:0.001:6.99;
yq = interp1(x,y,xq,'spline');
ankleangles(1,:) = xq;
ankleangles(2,:) = yq;

% MAKE ANGLES COMPATIBLE WITH MATLAB
a = ankleangles(2,:);
b = kneeangles(2,:);
c = hipangles(2,:);

ankleangles(2,:) = -(a - 90);
kneeangles(2,:) = (a - b);
hipangles(2,:) = -(c - b);

save('Human Positions\AA.mat','ankleangles');
save('Human Positions\KA.mat','kneeangles');
save('Human Positions\HA.mat','hipangles');

% ANKLE ANGLE FILTER
load('AA.mat');
y = ankleangles(2,:);
x = ankleangles(1,:);
y((3100):6901) = y(3100);
y(1:2000) = -10;
xx = 0:0.001:6.89;
xxx = 0:0.001:6.88;
Fs = 1000;
f = linspace(0, Fs,length(y));
[H,a]  = butter(2,0.003,'low');
aaf = filtfilt(H,a,y);
aaf(2,:) = aaf;
aaf(1,:) = x;       
save('Human Positions\FAA.mat','aaf');

% KNEE ANGLE FILTER
load('KA.mat');
y = kneeangles(2,:);
x = kneeangles(1,:);
y(1:2200) = y(1);
y(3100:6901) = y(3100);
xx = 0:0.01:6.89;
xxx = 0:0.01:6.88;
Fs = 1000;
f = linspace(0, Fs,length(y));
Y = fft(y);
[H,a]  = butter(2,0.003,'low');
kaf = filtfilt(H,a,y);
kaf(2,:) = kaf;
kaf(1,:) = x;       
save('Human Positions\FKA.mat','kaf');

% HIP ANGLE FILTER
load('HA.mat');
y = hipangles(2,:);
x = hipangles(1,:);
y(3100:6901) = y(3100);
y(2300:2600) = y(2300);
xx = 0:0.001:6.89;
xxx = 0:0.001:6.88;
Fs = 1000;
f = linspace(0, Fs,length(y));
[H,a]  = butter(2,0.003,'low');
haf = filtfilt(H,a,y);
haf(2,:) = haf;
haf(1,:) = x;       
save('Human Positions\FHA.mat','haf');

%% HUMAN Dynamic DATA
% % 
% [humanModel, humanAnthropometry] = ...
%    fnc_ModelCreator('ModelFactory\data\NominalHuman.env');
% %  [humanModel, humanAnthropometry] = ...
% %     fnc_ModelCreator('ModelFactory\data\NominalMinus15Human.env');
% % [humanModel, humanAnthropometry] = ...
% %     fnc_ModelCreator('ModelFactory\data\NominalPlus15Human.env');
% 
% % PercentComp, 1 = 100%, 2 = 60%, 3 = 30%  


load('FAA.mat');
load('FHA.mat');
load('FKA.mat');

aa = aaf(2,1);
ka = kaf(2,1);
ha = haf(2,1);

%% Segment Lengths
LenPelZ = humanModel{1}.length;
LenMidTrZ = humanModel{8}.length;
LenUpTrZ = humanModel{9}.length;
LenHeadZ = humanModel{10}.length;
LenThighZ = humanModel{2}.length;
LenShankZ = humanModel{3}.length;
LenUpArmZ = humanModel{11}.length;
LenLwArmZ = humanModel{12}.length;
LenHandZ = humanModel{13}.length;

ThighRef = LenThighZ/2; % Thigh reference is half way down the thigh
ShankRef = LenShankZ/2; % Shank reference is halfway down the shank 
WidLegPosY = humanAnthropometry.hipCenterWidth/2;
WidArmPosY = humanAnthropometry.shoulderCenterWidth/2;
HeightFootZ = humanAnthropometry.heelAnkleZOffset;
Ankle2FootRefX = humanAnthropometry.heelAnkleXOffset;
ShoulderRef = humanAnthropometry.shoulderNeckZOffset;
Tr2UpArm = LenUpTrZ - ShoulderRef; % Middle of Upper trunk ref to shoulder in the z direction

ThighXDir = 0.1; %width from front to back of thigh
ShankXDir = 0.1; %width from front to back of the shank 
PelvisXDir = 0.1; %width from front to back of pelvis

%% Ground Contact Forces
GroundStiffness = 26000; %N/m
GroundDamping = 4000; %N/m/s
PenetrationDamp = 0.001; %mm
PenetrationExp = 1; 
Ground_Kfriction = 1;
Ground_Sfriction = 1;
VelocityThreshold = 0.001; 
GroundContactSphereRad = 0.05;
GroundThickness = 0.1;
GroundWidth = 2; 
GroundLength = 2;
FootContLength = 0.3; %humanModel{4}.length;
FootContactWidth = humanAnthropometry.footWidth;
FootRef2Ground = 0.009;


%% Seat Contact Forces
SeatStiffness = 480000; 
SeatDamping = 0;
Seat_Kfriction = 1;
Seat_Sfriction = 1;
seatOffsetAngle = -kaf(2,1) + (-aaf(2,1)+90);
SeatHipContactOffset = 0.085;
seatContactSphereRad = 0.08;
seatheight = -seatContactSphereRad +... 
    HeightFootZ + LenShankZ*cosd(abs(aa)) + LenThighZ*sind((90-aa)-ka) ...
    + 0.015 +0.03; 

%% Human To Exoskeleton Contact Points
% User Request
PercentThighCont = 0.5;
PercentShankCont = 0.45;
HeigtAboveHipCont = 0.07;
% x y z contact points
HipCont = [-PelvisXDir/2 0 HeigtAboveHipCont]; % measured from human hip joint
ThighCont = [ThighXDir/2 0 -(LenThighZ*PercentThighCont)]; % measured from human Hip joint
ShankCont = [ShankXDir/2 0 -(LenShankZ*PercentShankCont)]; % measured from human knee joint
FootCont = [0.053 0 -0.063]; % measured from humna ankle joint

%% HUMAN multibody DATA
%============= Transform =============%


smiData = struct;
smiData.RigidTransform = struct;
% Middle(reference) of Pelvis to Pelvis-Midtrunk connection point
smiData.RigidTransform(1).translation = [0 0 LenPelZ/2]; 
smiData.RigidTransform(1).angle = 0;
smiData.RigidTransform(1).axis = [0 0 0];

% Rotation of axis from Pelvis to Hip revolute joint
smiData.RigidTransform(2).translation = [0 0 0];
smiData.RigidTransform(2).angle = (2*pi)/3;
smiData.RigidTransform(2).axis = [0.57735026918962584 -0.57735026918962584 ...
                                  0.57735026918962584];
                              
% Rotation of axis from Hip revolute joint to Thigh
smiData.RigidTransform(3).translation = [0 0 0];
smiData.RigidTransform(3).angle = (2*pi)/3;
smiData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 ...
                                  0.57735026918962584];
                              
% Middle(reference) of midtrunk to MidTrunk-UpperTrunk connection  
smiData.RigidTransform(7).translation = [0 0 LenMidTrZ/2];
smiData.RigidTransform(7).angle = 0;
smiData.RigidTransform(7).axis = [0 0 0];

% MidTrunk - UpperTrunk conenection to UpperTrunk middle(reference)
smiData.RigidTransform(8).translation = [0 0 LenUpTrZ/2];
smiData.RigidTransform(8).angle = 0;
smiData.RigidTransform(8).axis = [0 0 0];

% Pelvis-Midtrunk connection to middle(reference) of Midtrunk
smiData.RigidTransform(10).translation = [0 0 LenMidTrZ/2];
smiData.RigidTransform(10).angle = 0;
smiData.RigidTransform(10).axis = [0 0 0];

% Middle(reference) of UpperTrunk to UpperTrunk-Head connection
smiData.RigidTransform(11).translation = [0 0 LenUpTrZ/2];
smiData.RigidTransform(11).angle = 0;
smiData.RigidTransform(11).axis = [0 0 0];

% Middle(reference) of UpperTrunk to UpperTrunk - UpperArm Connection
smiData.RigidTransform(13).translation = [0 0 Tr2UpArm];
smiData.RigidTransform(13).angle = -pi/10;
smiData.RigidTransform(13).axis = [0 1 0];

% UpperTrunk - Head Connection to Head middle(reference)
smiData.RigidTransform(15).translation = [0 0 LenHeadZ/2];
smiData.RigidTransform(15).angle = 0;
smiData.RigidTransform(15).axis = [0 0 0];

% Thigh reference to Knee revolute joint (translation and rotation) 
smiData.RigidTransform(19).translation = [0 0 -LenThighZ];
smiData.RigidTransform(19).angle = (2*pi)/3;
smiData.RigidTransform(19).axis = [0.57735026918962584 -0.57735026918962584 ...
                                   0.57735026918962584];
                               
% Rotation from knee revolute joint to shank reference  
smiData.RigidTransform(20).translation = [0 0 0];
smiData.RigidTransform(20).angle = (2*pi)/3;
smiData.RigidTransform(20).axis = [0.57735026918962584 -0.57735026918962584 ...
                                   0.57735026918962584];
                               
% Shank reference to ankle revolute joint
smiData.RigidTransform(21).translation = [0 0 -LenShankZ];
smiData.RigidTransform(21).angle = (2*pi)/3;
smiData.RigidTransform(21).axis = [0.57735026918962584 -0.57735026918962584 ...
                                   0.57735026918962584];
                               
% Ankle revolute joint to ankle reference (rotation)  
smiData.RigidTransform(22).translation = [0 0 0];
smiData.RigidTransform(22).angle = (2*pi)/3;
smiData.RigidTransform(22).axis = [0.57735026918962584 -0.57735026918962584 ...
                                   0.57735026918962584];
                               
% Upper arm reference to upper arm-lower arm connection (shoulder to elbow)
smiData.RigidTransform(25).translation = [0 0 -LenUpArmZ]; %length of upper arm
smiData.RigidTransform(25).angle = 0;
smiData.RigidTransform(25).axis = [0 0 0];

% LowerArm reference to Lower arm - hand connection (length of lower arm)
smiData.RigidTransform(27).translation = [0 0 sin(pi/10)*LenLwArmZ]; % length of lower arm 
smiData.RigidTransform(27).angle = 0;
smiData.RigidTransform(27).axis = [0 0 0];

% thigh reference to right thigh solid reference(middle)
smiData.RigidTransform(29).translation = [0 -WidLegPosY -ThighRef];
smiData.RigidTransform(29).angle = 0;
smiData.RigidTransform(29).axis = [0 0 0];

% thigh reference to left thight solid reference(middle)
smiData.RigidTransform(30).translation = [0 WidLegPosY -ThighRef];
smiData.RigidTransform(30).angle = 0;
smiData.RigidTransform(30).axis = [0 0 0];

% shank reference(same pos as knee) to right shank solid reference(middle)
smiData.RigidTransform(31).translation = [0 -WidLegPosY -ShankRef];
smiData.RigidTransform(31).angle = 0;
smiData.RigidTransform(31).axis = [0 0 0];

% shank reference to left shank solid reference(middle)
smiData.RigidTransform(32).translation = [0 WidLegPosY -ShankRef];
smiData.RigidTransform(32).angle = 0;
smiData.RigidTransform(32).axis = [0 0 0];

% foot reference (same pos as ankle) to right foot solid reference(middle)
smiData.RigidTransform(33).translation = [Ankle2FootRefX -WidLegPosY -HeightFootZ/2];
smiData.RigidTransform(33).angle = 0;
smiData.RigidTransform(33).axis = [0 0 0];

% foot reference (same pos as ankle) to left foot solid reference(middle)
smiData.RigidTransform(34).translation = [Ankle2FootRefX WidLegPosY -HeightFootZ/2];
smiData.RigidTransform(34).angle = 0;
smiData.RigidTransform(34).axis = [0 0 0];

% UpperArm reference(shoulder pos) to right UpperArm solid reference(middle)
smiData.RigidTransform(35).translation = [0 -WidArmPosY -LenUpArmZ/2];
smiData.RigidTransform(35).angle = 0;
smiData.RigidTransform(35).axis = [0 0 0];

% UpperArm reference(shoulder pos) to left UpperArm solid reference(middle)
smiData.RigidTransform(36).translation = [0 WidArmPosY -LenUpArmZ/2];
smiData.RigidTransform(36).angle = 0;
smiData.RigidTransform(36).axis = [0 0 0];

% LowerArm reference(elbow pos) to right Lower Arm solid reference(middle)
smiData.RigidTransform(37).translation = [0 -WidArmPosY+cos(pi/10)*LenLwArmZ/2 sin(pi/10)*LenLwArmZ/2];
smiData.RigidTransform(37).angle = 3*pi/5;
smiData.RigidTransform(37).axis = [1 0 0];

% LowerArm reference(elbow pos) to left Lower Arm solid reference(middle)
smiData.RigidTransform(38).translation = [0 (WidArmPosY-cos(pi/10)*LenLwArmZ/2) sin(pi/10)*LenLwArmZ/2];
smiData.RigidTransform(38).angle = -3*pi/5;
smiData.RigidTransform(38).axis = [1 0 0];

% Hand ref(wrist position) to right hand solid reference (middle)
smiData.RigidTransform(39).translation = [0 cos(pi/10)*LenHandZ sin(pi/10)*LenHandZ/2];
smiData.RigidTransform(39).angle = 3*pi/5;
smiData.RigidTransform(39).axis = [1 0 0];

% Hand ref(wrist position) to left hand solid reference (middle)
smiData.RigidTransform(40).translation = [0 -cos(pi/10)*LenHandZ sin(pi/10)*LenHandZ/2];
smiData.RigidTransform(40).angle = -3*pi/5;
smiData.RigidTransform(40).axis = [1 0 0];

% Ground to foot Reference (ankle position) (height of foot) 
smiData.RigidTransform(41).translation = [0 0 0];
smiData.RigidTransform(41).angle = 0;
smiData.RigidTransform(41).axis = [0 0 0];

%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)
op = 1;
smiData.Solid = struct;
% PELVIS
smiData.Solid(1).mass = humanModel{1}.mass;
smiData.Solid(1).CoM = humanModel{1}.com;
smiData.Solid(1).MoI = [humanModel{1}.inertia(1,1) ...
    humanModel{1}.inertia(2,2) humanModel{1}.inertia(3,3)];
smiData.Solid(1).PoI = [humanModel{1}.inertia(1,2) ...
    humanModel{1}.inertia(1,3) humanModel{1}.inertia(2,3)];
smiData.Solid(1).color = [0.0823 0.37647 0.7412];
smiData.Solid(1).opacity = op;

% MID TRUNK
smiData.Solid(2).mass = humanModel{8}.mass;
smiData.Solid(2).CoM = humanModel{8}.com - [0 0 LenMidTrZ/2];
smiData.Solid(2).MoI = [humanModel{8}.inertia(1,1) ...
    humanModel{8}.inertia(2,2) humanModel{8}.inertia(3,3)];
smiData.Solid(2).PoI = [humanModel{8}.inertia(1,2) ...
    humanModel{8}.inertia(1,3) humanModel{8}.inertia(2,3)];
smiData.Solid(2).color = [0.9254 0.0823 0.0823];
smiData.Solid(2).opacity = op;

% UPPER TRUNK
smiData.Solid(3).mass = humanModel{9}.mass;
smiData.Solid(3).CoM = humanModel{9}.com - [0 0 LenUpTrZ/2];
smiData.Solid(3).MoI = [humanModel{9}.inertia(1,1) ...
    humanModel{9}.inertia(2,2) humanModel{9}.inertia(3,3)];
smiData.Solid(3).PoI = [humanModel{9}.inertia(1,2) ...
    humanModel{9}.inertia(1,3) humanModel{9}.inertia(2,3)];
smiData.Solid(3).color = [0.9254 0.0823 0.0823];
smiData.Solid(3).opacity = op;

% HEAD
smiData.Solid(4).mass = humanModel{10}.mass;
smiData.Solid(4).CoM = humanModel{10}.com - [0 0 LenHeadZ/2];
smiData.Solid(4).MoI = [humanModel{10}.inertia(1,1) ...
    humanModel{10}.inertia(2,2) humanModel{10}.inertia(3,3)];
smiData.Solid(4).PoI = [humanModel{10}.inertia(1,2) ...
    humanModel{10}.inertia(1,3) humanModel{10}.inertia(2,3)];
smiData.Solid(4).color = [0.945, 0.76, 0.49];
smiData.Solid(4).opacity = op;

% 1 THIGH
smiData.Solid(5).mass = humanModel{2}.mass;
smiData.Solid(5).CoM = [0 0 LenThighZ/2] + humanModel{2}.com;
smiData.Solid(5).MoI = [humanModel{2}.inertia(1,1) ...
    humanModel{2}.inertia(2,2) humanModel{2}.inertia(3,3)];
smiData.Solid(5).PoI = [humanModel{2}.inertia(1,2) ...
    humanModel{2}.inertia(1,3) humanModel{2}.inertia(2,3)];
smiData.Solid(5).color = [0.0823 0.37647 0.7412];
smiData.Solid(5).opacity = op;

% 1 SHANK
smiData.Solid(6).mass = humanModel{3}.mass;
smiData.Solid(6).CoM = [0 0 LenShankZ/2] + humanModel{3}.com;
smiData.Solid(6).MoI = [humanModel{3}.inertia(1,1) ...
    humanModel{3}.inertia(2,2) humanModel{3}.inertia(3,3)];
smiData.Solid(6).PoI = [humanModel{3}.inertia(1,2) ...
    humanModel{3}.inertia(1,3) humanModel{3}.inertia(2,3)];
smiData.Solid(6).color = [0.945, 0.76, 0.49];
smiData.Solid(6).opacity = op;

% 1 FOOT
smiData.Solid(7).mass = humanModel{4}.mass;
smiData.Solid(7).CoM = [0 0 HeightFootZ/2] + humanModel{4}.com;
smiData.Solid(7).MoI = [humanModel{7}.inertia(1,1) ...
    humanModel{7}.inertia(2,2) humanModel{7}.inertia(3,3)];
smiData.Solid(7).PoI = [humanModel{7}.inertia(1,2) ...
    humanModel{7}.inertia(1,3) humanModel{7}.inertia(2,3)];
smiData.Solid(7).color =[0.945, 0.76, 0.49];
smiData.Solid(7).opacity = op;

% 1 UPPER ARM
smiData.Solid(8).mass = humanModel{11}.mass;
smiData.Solid(8).CoM = [0 0 LenUpArmZ/2] + humanModel{11}.com;
smiData.Solid(8).MoI = [humanModel{11}.inertia(1,1) ...
    humanModel{11}.inertia(2,2) humanModel{11}.inertia(3,3)];
smiData.Solid(8).PoI = [humanModel{11}.inertia(1,2) ...
    humanModel{11}.inertia(1,3) humanModel{11}.inertia(2,3)];
smiData.Solid(8).color = [0.9254 0.0823 0.0823];
smiData.Solid(8).opacity = op;

% 1 LOWER ARM
smiData.Solid(9).mass = humanModel{12}.mass;
smiData.Solid(9).CoM = [0 0 LenLwArmZ/2] + humanModel{12}.com;
smiData.Solid(9).MoI = [humanModel{12}.inertia(1,1) ...
    humanModel{12}.inertia(2,2) humanModel{12}.inertia(3,3)];
smiData.Solid(9).PoI = [humanModel{12}.inertia(1,2) ...
    humanModel{12}.inertia(1,3) humanModel{12}.inertia(2,3)];
smiData.Solid(9).color = [0.945, 0.76, 0.49];
smiData.Solid(9).opacity = op;

% 1 HAND
smiData.Solid(10).mass = humanModel{13}.mass;
smiData.Solid(10).CoM = [0 0 LenHandZ/2] + humanModel{13}.com;
smiData.Solid(10).MoI = [humanModel{13}.inertia(1,1) ...
    humanModel{13}.inertia(2,2) humanModel{13}.inertia(3,3)];
smiData.Solid(10).PoI = [humanModel{13}.inertia(1,2) ...
    humanModel{13}.inertia(1,3) humanModel{13}.inertia(2,3)];
smiData.Solid(10).color = [0.945, 0.76, 0.49];
smiData.Solid(10).opacity = op;

%% EXOSKELETON DATA 

%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
EXOsmiData.RigidTransform(60).translation = [0.0 0.0 0.0];
EXOsmiData.RigidTransform(60).angle = 0.0;
EXOsmiData.RigidTransform(60).axis = [0.0 0.0 0.0];
EXOsmiData.RigidTransform(60).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis -
EXOsmiData.RigidTransform(1).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
EXOsmiData.RigidTransform(1).ID = 'B[40:-:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(2).translation = [0 0 0.0550000000000000];  % m
EXOsmiData.RigidTransform(2).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(2).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
EXOsmiData.RigidTransform(2).ID = 'F[40:-:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(3).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(3).angle = 0;  % rad
EXOsmiData.RigidTransform(3).axis = [0 0 0];
EXOsmiData.RigidTransform(3).ID = 'B[40:-:54]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(4).translation = [0.0850000000000000 0 -0.059999999999999817];  % m
EXOsmiData.RigidTransform(4).angle = 0;  % rad
EXOsmiData.RigidTransform(4).axis = [0 0 0];
EXOsmiData.RigidTransform(4).ID = 'F[40:-:54]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(5).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(5).angle = 0;  % rad
EXOsmiData.RigidTransform(5).axis = [0 0 0];
EXOsmiData.RigidTransform(5).ID = 'B[40:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(6).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(6).angle = 0;  % rad
EXOsmiData.RigidTransform(6).axis = [0 0 0];
EXOsmiData.RigidTransform(6).ID = 'F[40:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(7).translation = [0 0 -0.0700000000000000];  % m
EXOsmiData.RigidTransform(7).angle = 0;  % rad
EXOsmiData.RigidTransform(7).axis = [0 0 0];
EXOsmiData.RigidTransform(7).ID = 'B[41:-:47]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(8).translation = [0 0 0.060437292536608803];  % m
EXOsmiData.RigidTransform(8).angle = 0;  % rad
EXOsmiData.RigidTransform(8).axis = [0 0 0];
EXOsmiData.RigidTransform(8).ID = 'F[41:-:47]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(9).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(9).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(9).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(9).ID = 'B[:-:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(10).translation = [0 0 0.0550000000000000];  % m
EXOsmiData.RigidTransform(10).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(10).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(10).ID = 'F[:-:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(11).translation = [0 0 -0.0450000000];  % m
EXOsmiData.RigidTransform(11).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(11).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(11).ID = 'B[47:-:48]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(12).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(12).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(12).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(12).ID = 'F[47:-:48]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(13).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(13).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(13).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(13).ID = 'B[48:-:69]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(14).translation = [0 0 0.0350000000000000];  % m
EXOsmiData.RigidTransform(14).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(14).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(14).ID = 'F[48:-:69]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(15).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(15).angle = 0;  % rad
EXOsmiData.RigidTransform(15).axis = [0 0 0];
EXOsmiData.RigidTransform(15).ID = 'B[54:-:63]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(16).translation = [0 0 -0.2];  % m
EXOsmiData.RigidTransform(16).angle = 0;  % rad
EXOsmiData.RigidTransform(16).axis = [0 0 0];
EXOsmiData.RigidTransform(16).ID = 'F[54:-:63]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(17).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(17).angle = 0;  % rad
EXOsmiData.RigidTransform(17).axis = [0 0 0];
EXOsmiData.RigidTransform(17).ID = 'B[54:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(18).translation = [-0.0850000000000000 0 0.0600000000000];  % m
EXOsmiData.RigidTransform(18).angle = 0;  % rad
EXOsmiData.RigidTransform(18).axis = [0 0 0];
EXOsmiData.RigidTransform(18).ID = 'F[54:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(19).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(19).angle = 0;  % rad
EXOsmiData.RigidTransform(19).axis = [0 0 0];
EXOsmiData.RigidTransform(19).ID = 'B[63:-:64]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(20).translation = [-0.085000 0 -0.1199997408306];  % m
EXOsmiData.RigidTransform(20).angle = 0;  % rad
EXOsmiData.RigidTransform(20).axis = [0 0 0];
EXOsmiData.RigidTransform(20).ID = 'F[63:-:64]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(21).translation = [0 0 -0.12];  % m
EXOsmiData.RigidTransform(21).angle = 0;  % rad
EXOsmiData.RigidTransform(21).axis = [0 0 0];
EXOsmiData.RigidTransform(21).ID = 'B[69:-:70]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(22).translation = [0 0 -0.019611641841704303];  % m
EXOsmiData.RigidTransform(22).angle = 0;  % rad
EXOsmiData.RigidTransform(22).axis = [-0 -1 -0];
EXOsmiData.RigidTransform(22).ID = 'F[69:-:70]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(23).translation = [0 0 -0.03500000000000000];  % m
EXOsmiData.RigidTransform(23).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(23).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(23).ID = 'B[70:-:71]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(24).translation = [0 0 0.03500000000000000];  % m
EXOsmiData.RigidTransform(24).angle = 2.0943951023931957;  % rad
EXOsmiData.RigidTransform(24).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962562];
EXOsmiData.RigidTransform(24).ID = 'F[70:-:71]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(25).translation = [0 0 -0.12];  % m
EXOsmiData.RigidTransform(25).angle = 0;  % rad
EXOsmiData.RigidTransform(25).axis = [0 0 0];
EXOsmiData.RigidTransform(25).ID = 'B[71:-:72]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(26).translation = [0 0 -0.019676919702425424];  % m
EXOsmiData.RigidTransform(26).angle = 0;  % rad
EXOsmiData.RigidTransform(26).axis = [-0 -1 -0];
EXOsmiData.RigidTransform(26).ID = 'F[71:-:72]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(27).translation = [0 0 -0.03500000000000000];  % m
EXOsmiData.RigidTransform(27).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(27).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(27).ID = 'B[72:-:73]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(28).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(28).angle = 2.0943951023931957;  % rad
EXOsmiData.RigidTransform(28).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962562];
EXOsmiData.RigidTransform(28).ID = 'F[72:-:73]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(29).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(29).angle = 2.0943951023931953;  % rad
EXOsmiData.RigidTransform(29).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(29).ID = 'B[73:-:81]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(30).translation = [0 0 0.0250000000000000];  % m
EXOsmiData.RigidTransform(30).angle = 2.0943951023931957;  % rad
EXOsmiData.RigidTransform(30).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962562];
EXOsmiData.RigidTransform(30).ID = 'F[73:-:81]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(31).translation = [0 0 -0.0400000000];  % m
EXOsmiData.RigidTransform(31).angle = 0;  % rad
EXOsmiData.RigidTransform(31).axis = [0 0 0];
EXOsmiData.RigidTransform(31).ID = 'B[81:-:82]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(32).translation = [0 0 0.060242181502998232];  % m
EXOsmiData.RigidTransform(32).angle = 0;  % rad
EXOsmiData.RigidTransform(32).axis = [0 0 0];
EXOsmiData.RigidTransform(32).ID = 'F[81:-:82]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(33).translation = [0 0 0];  % m
EXOsmiData.RigidTransform(33).angle = -2.0943951023931957;  % rad
EXOsmiData.RigidTransform(33).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
EXOsmiData.RigidTransform(33).ID = 'B[82:-:83]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(34).translation = [-0.054000000000000 0 0.063000000000000];  % m
EXOsmiData.RigidTransform(34).angle = 2.0943951023931957;  % rad
EXOsmiData.RigidTransform(34).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962562];
EXOsmiData.RigidTransform(34).ID = 'F[82:-:83]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(35).translation = [0 -0.155 0];  % m
EXOsmiData.RigidTransform(35).angle = 0;  % rad
EXOsmiData.RigidTransform(35).axis = [0 0 0];
EXOsmiData.RigidTransform(35).ID = 'AssemblyGround[41:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(36).translation = [0 0.155 0];  % m
EXOsmiData.RigidTransform(36).angle = 0;  % rad
EXOsmiData.RigidTransform(36).axis = [0 0 0];
EXOsmiData.RigidTransform(36).ID = 'AssemblyGround[41:43]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(37).translation = [0 -0.155 0];  % m
EXOsmiData.RigidTransform(37).angle = 0;  % rad
EXOsmiData.RigidTransform(37).axis = [0 0 0];
EXOsmiData.RigidTransform(37).ID = 'AssemblyGround[47:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(38).translation = [0 0.155 0];  % m
EXOsmiData.RigidTransform(38).angle = 0;  % rad
EXOsmiData.RigidTransform(38).axis = [0 0 0];
EXOsmiData.RigidTransform(38).ID = 'AssemblyGround[47:45]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(39).translation = [0 -0.08500000000000000 0];  % m
EXOsmiData.RigidTransform(39).angle = 0;  % rad
EXOsmiData.RigidTransform(39).axis = [0 0 0];
EXOsmiData.RigidTransform(39).ID = 'AssemblyGround[48:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(40).translation = [0 0.08500000000000000 0];  % m
EXOsmiData.RigidTransform(40).angle = 0;  % rad
EXOsmiData.RigidTransform(40).axis = [0 0 0];
EXOsmiData.RigidTransform(40).ID = 'AssemblyGround[48:43]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(41).translation = [0 -0.07000000000000000 0];  % m
EXOsmiData.RigidTransform(41).angle = 0;  % rad
EXOsmiData.RigidTransform(41).axis = [0 0 0];
EXOsmiData.RigidTransform(41).ID = 'AssemblyGround[54:74]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(42).translation = [0 0.07000000000000000 0];  % m
EXOsmiData.RigidTransform(42).angle = 0;  % rad
EXOsmiData.RigidTransform(42).axis = [0 0 0];
EXOsmiData.RigidTransform(42).ID = 'AssemblyGround[54:79]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(43).translation = [0 -0.07000000000000000 0];  % m
EXOsmiData.RigidTransform(43).angle = 0;  % rad
EXOsmiData.RigidTransform(43).axis = [0 0 0];
EXOsmiData.RigidTransform(43).ID = 'AssemblyGround[63:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(44).translation = [0 0.07000000000000000 0];  % m
EXOsmiData.RigidTransform(44).angle = 0;  % rad
EXOsmiData.RigidTransform(44).axis = [0 0 0];
EXOsmiData.RigidTransform(44).ID = 'AssemblyGround[63:47]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(45).translation = [0 -0.1450000000 0];  % m
EXOsmiData.RigidTransform(45).angle = 0;  % rad
EXOsmiData.RigidTransform(45).axis = [0 0 0];
EXOsmiData.RigidTransform(45).ID = 'AssemblyGround[69:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(46).translation = [0 0.1450000000 0];  % m
EXOsmiData.RigidTransform(46).angle = 0;  % rad
EXOsmiData.RigidTransform(46).axis = [0 0 0];
EXOsmiData.RigidTransform(46).ID = 'AssemblyGround[69:47]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(47).translation = [0 -0.145000000000 0];  % m
EXOsmiData.RigidTransform(47).angle = 0;  % rad
EXOsmiData.RigidTransform(47).axis = [0 0 0];
EXOsmiData.RigidTransform(47).ID = 'AssemblyGround[70:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(48).translation = [0 0.14499999999999999 0];  % m
EXOsmiData.RigidTransform(48).angle = 0;  % rad
EXOsmiData.RigidTransform(48).axis = [0 0 0];
EXOsmiData.RigidTransform(48).ID = 'AssemblyGround[70:49]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(49).translation = [0 -0.155 0];  % m
EXOsmiData.RigidTransform(49).angle = 0;  % rad
EXOsmiData.RigidTransform(49).axis = [0 0 0];
EXOsmiData.RigidTransform(49).ID = 'AssemblyGround[71:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(50).translation = [0 0.155 0];  % m
EXOsmiData.RigidTransform(50).angle = 0;  % rad
EXOsmiData.RigidTransform(50).axis = [0 0 0];
EXOsmiData.RigidTransform(50).ID = 'AssemblyGround[71:44]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(51).translation = [0 -0.155 0];  % m
EXOsmiData.RigidTransform(51).angle = 0;  % rad
EXOsmiData.RigidTransform(51).axis = [0 0 0];
EXOsmiData.RigidTransform(51).ID = 'AssemblyGround[72:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(52).translation = [0 0.155 0];  % m
EXOsmiData.RigidTransform(52).angle = 0;  % rad
EXOsmiData.RigidTransform(52).axis = [0 0 0];
EXOsmiData.RigidTransform(52).ID = 'AssemblyGround[72:47]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(53).translation = [0 -0.08500000000000000 0];  % m
EXOsmiData.RigidTransform(53).angle = 0;  % rad
EXOsmiData.RigidTransform(53).axis = [0 0 0];
EXOsmiData.RigidTransform(53).ID = 'AssemblyGround[73:49]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(54).translation = [0 0.08500000000000000 0];  % m
EXOsmiData.RigidTransform(54).angle = 0;  % rad
EXOsmiData.RigidTransform(54).axis = [0 0 0];
EXOsmiData.RigidTransform(54).ID = 'AssemblyGround[73:52]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(55).translation = [0 -0.145000000000000 0];  % m
EXOsmiData.RigidTransform(55).angle = 0;  % rad
EXOsmiData.RigidTransform(55).axis = [0 0 0];
EXOsmiData.RigidTransform(55).ID = 'AssemblyGround[81:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(56).translation = [0 0.145000000000 0];  % m
EXOsmiData.RigidTransform(56).angle = 0;  % rad
EXOsmiData.RigidTransform(56).axis = [0 0 0];
EXOsmiData.RigidTransform(56).ID = 'AssemblyGround[81:45]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(57).translation = [0 -0.14500000000 0];  % m
EXOsmiData.RigidTransform(57).angle = 0;  % rad
EXOsmiData.RigidTransform(57).axis = [0 0 0];
EXOsmiData.RigidTransform(57).ID = 'AssemblyGround[82:41]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(58).translation = [0 0.1450000000 0];  % m
EXOsmiData.RigidTransform(58).angle = 0;  % rad
EXOsmiData.RigidTransform(58).axis = [0 0 0];
EXOsmiData.RigidTransform(58).ID = 'AssemblyGround[82:48]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(59).translation = [0 -0.08500000000000000 0];  % m
EXOsmiData.RigidTransform(59).angle = 0;  % rad
EXOsmiData.RigidTransform(59).axis = [0 0 0];
EXOsmiData.RigidTransform(59).ID = 'AssemblyGround[83:40]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
EXOsmiData.RigidTransform(60).translation = [0 0.085000000000000006 0];  % m
EXOsmiData.RigidTransform(60).angle = 0;  % rad
EXOsmiData.RigidTransform(60).axis = [0 0 0];
EXOsmiData.RigidTransform(60).ID = 'AssemblyGround[83:43]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
EXOsmiData.Solid(16).mass = 0.0;
EXOsmiData.Solid(16).CoM = [0.0 0.0 0.0];
EXOsmiData.Solid(16).MoI = [0.0 0.0 0.0];
EXOsmiData.Solid(16).PoI = [0.0 0.0 0.0];
EXOsmiData.Solid(16).color = [0.0 0.0 0.0];
EXOsmiData.Solid(16).opacity = 0.0;
EXOsmiData.Solid(16).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(1).mass = 0.66287623344800539;  % kg
EXOsmiData.Solid(1).CoM = [-0.00037432667548470335 0 0.0012923389948269136];  % m
EXOsmiData.Solid(1).MoI = [0.0067287127473826805 0.0026656697874138735 0.0090986376804368524];  % kg*m^2
EXOsmiData.Solid(1).PoI = [0 -3.2067576705133817e-07 0];  % kg*m^2
EXOsmiData.Solid(1).color = [0.5 0.5 0.5];
EXOsmiData.Solid(1).opacity = 1;
EXOsmiData.Solid(1).ID = 'EXO_HIP_CONNECTION_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(2).mass = 0.087394501579311445;  % kg
EXOsmiData.Solid(2).CoM = [0 0 0.0041067811055926617];  % m
EXOsmiData.Solid(2).MoI = [0.00013612322903336496 0.00014268410568742069 8.2884516803732429e-06];  % kg*m^2
EXOsmiData.Solid(2).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(2).color = [0.5 0.5 0.5];
EXOsmiData.Solid(2).opacity = 1;
EXOsmiData.Solid(2).ID = 'UPPER_THIGH_BRACE_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(3).mass = 0.1144945015794999;  % kg
EXOsmiData.Solid(3).CoM = [0 0 0.021066818879601917];  % m
EXOsmiData.Solid(3).MoI = [0.00028269670637911214 0.00028952858299254345 8.4691183064225213e-06];  % kg*m^2
EXOsmiData.Solid(3).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(3).color = [0.5 0.5 0.5];
EXOsmiData.Solid(3).opacity = 1;
EXOsmiData.Solid(3).ID = 'LOWER_THIGH_BRACE_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(4).mass = 0.018082284409958408;  % kg
EXOsmiData.Solid(4).CoM = [0 0 0];  % m
EXOsmiData.Solid(4).MoI = [3.1173986827725263e-05 3.8739556895270915e-05 6.2516262570900118e-05];  % kg*m^2
EXOsmiData.Solid(4).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(4).color = [0.5 0.5 0.5];
EXOsmiData.Solid(4).opacity = 1;
EXOsmiData.Solid(4).ID = 'THIGH_CONNECTION_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(5).mass = 0.15785450157951625;  % kg
EXOsmiData.Solid(5).CoM = [0 0 0.04062422888719356];  % m
EXOsmiData.Solid(5).MoI = [0.00094796891809071531 0.00093891822904739342 1.1173472402982529e-05];  % kg*m^2
EXOsmiData.Solid(5).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(5).color = [0.5 0.5 0.5];
EXOsmiData.Solid(5).opacity = 1;
EXOsmiData.Solid(5).ID = 'LOWER_TRUNK_BRACE_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(6).mass = 0.15572607255676624;  % kg
EXOsmiData.Solid(6).CoM = [0 0 0.0086838505149002283];  % m
EXOsmiData.Solid(6).MoI = [0.00081030049366196701 0.00079836599535632947 1.503805784825199e-05];  % kg*m^2
EXOsmiData.Solid(6).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(6).color = [0.5 0.5 0.5];
EXOsmiData.Solid(6).opacity = 1;
EXOsmiData.Solid(6).ID = 'UPPER_TRUNK_BRACE_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(7).mass = 0.81703090477954066;  % kg
EXOsmiData.Solid(7).CoM = [1.2326267739756076e-05 -1.1545890354114611e-06 -0.010731699868663245];  % m
EXOsmiData.Solid(7).MoI = [0.0050281043638518794 0.0057815967842958504 0.0065633357432693948];  % kg*m^2
EXOsmiData.Solid(7).PoI = [-1.2165074728833268e-07 -6.3656713495431304e-05 0];  % kg*m^2
EXOsmiData.Solid(7).color = [0.5 0.5 0.5];
EXOsmiData.Solid(7).opacity = 1;
EXOsmiData.Solid(7).ID = 'TRUNK_CONNECTION_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(8).mass = 0.095524501579664842;  % kg
EXOsmiData.Solid(8).CoM = [0 0 -0.018937863204347618];  % m
EXOsmiData.Solid(8).MoI = [0.00017063611723935746 0.00017629930637524458 7.0181391622159368e-06];  % kg*m^2
EXOsmiData.Solid(8).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(8).color = [0.5 0.5 0.5];
EXOsmiData.Solid(8).opacity = 1;
EXOsmiData.Solid(8).ID = 'UPPER_KNEE_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(9).mass = 0.057584501581191459;  % kg
EXOsmiData.Solid(9).CoM = [0 0 -0.001527668958024505];  % m
EXOsmiData.Solid(9).MoI = [4.7863181249815997e-05 5.2340745487731256e-05 5.6744309309259997e-06];  % kg*m^2
EXOsmiData.Solid(9).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(9).color = [0.5 0.5 0.5];
EXOsmiData.Solid(9).opacity = 1;
EXOsmiData.Solid(9).ID = 'LOWER_KNEE_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(10).mass = 0.095524501579664786;  % kg
EXOsmiData.Solid(10).CoM = [0 0 -0.01893786320434768];  % m
EXOsmiData.Solid(10).MoI = [0.00017063611723935738 0.0001762993063752445 7.0181391622159326e-06];  % kg*m^2
EXOsmiData.Solid(10).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(10).color = [0.5 0.5 0.5];
EXOsmiData.Solid(10).opacity = 1;
EXOsmiData.Solid(10).ID = 'UPPER_SHANK_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(11).mass = 0.057584501581191466;  % kg
EXOsmiData.Solid(11).CoM = [0 0 -0.0015276689580244725];  % m
EXOsmiData.Solid(11).MoI = [4.7863181249816045e-05 5.2340745487731303e-05 5.6744309309259997e-06];  % kg*m^2
EXOsmiData.Solid(11).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(11).color = [0.5 0.5 0.5];
EXOsmiData.Solid(11).opacity = 1;
EXOsmiData.Solid(11).ID = 'LOWER_SHANK_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(12).mass = 0.016956370986952952;  % kg
EXOsmiData.Solid(12).CoM = [0 0 0];  % m
EXOsmiData.Solid(12).MoI = [2.8927499963906293e-05 2.9359796215912234e-05 5.1346769376834627e-05];  % kg*m^2
EXOsmiData.Solid(12).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(12).color = [0.5 0.5 0.5];
EXOsmiData.Solid(12).opacity = 1;
EXOsmiData.Solid(12).ID = 'SHANK_CONNECTION_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(13).mass = 0.045389501579698212;  % kg
EXOsmiData.Solid(13).CoM = [0 0 0.00081929825449464453];  % m
EXOsmiData.Solid(13).MoI = [2.4163245511102149e-05 2.7683840960890933e-05 4.4633996427832061e-06];  % kg*m^2
EXOsmiData.Solid(13).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(13).color = [0.5 0.5 0.5];
EXOsmiData.Solid(13).opacity = 1;
EXOsmiData.Solid(13).ID = 'SHANK_ANKLE_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(14).mass = 0.096639676980384392;  % kg
EXOsmiData.Solid(14).CoM = [0 0 0.036945746403068497];  % m
EXOsmiData.Solid(14).MoI = [0.00015836868470890618 0.00016276000050883811 7.7632011139154975e-06];  % kg*m^2
EXOsmiData.Solid(14).PoI = [0 0 0];  % kg*m^2
EXOsmiData.Solid(14).color = [0.5 0.5 0.5];
EXOsmiData.Solid(14).opacity = 1;
EXOsmiData.Solid(14).ID = 'ANKLE_LINK_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(15).mass = 0.10075445189355303;  % kg
EXOsmiData.Solid(15).CoM = [-0.0060335590549396648 -0.022294196918456324 0.015048186535312681];  % m
EXOsmiData.Solid(15).MoI = [0.00014518766094486944 0.00023190077203743886 0.00029775761856916101];  % kg*m^2
EXOsmiData.Solid(15).PoI = [3.5089452237795967e-05 2.3954805917921091e-05 -1.562676169118534e-05];  % kg*m^2
EXOsmiData.Solid(15).color = [0.5 0.5 0.5];
EXOsmiData.Solid(15).opacity = 1;
EXOsmiData.Solid(15).ID = 'FOOT_ORTHOSIS_R_prt';

%Inertia Type - Custom
%Visual Properties - Simple
EXOsmiData.Solid(16).mass = 0.10075445189362831;  % kg
EXOsmiData.Solid(16).CoM = [-0.0060335590659663391 0.022294196918478292 0.015048186556231885];  % m
EXOsmiData.Solid(16).MoI = [0.00014518766111175087 0.00023190077230217734 0.0002977576186671364];  % kg*m^2
EXOsmiData.Solid(16).PoI = [-3.5089452273042167e-05 2.3954806068967967e-05 1.5626761709745181e-05];  % kg*m^2
EXOsmiData.Solid(16).color = [0.5 0.5 0.5];
EXOsmiData.Solid(16).opacity = 1;
EXOsmiData.Solid(16).ID = 'FOOT_ORTHOSIS_L_prt';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the CylindricalJoint structure array by filling in null values.
EXOsmiData.CylindricalJoint(1).Rz.Pos = 0.0;
EXOsmiData.CylindricalJoint(1).Pz.Pos = 0.0;
EXOsmiData.CylindricalJoint(1).ID = '';

EXOsmiData.CylindricalJoint(1).Rz.Pos = 15.272647823772671;  % deg
EXOsmiData.CylindricalJoint(1).Pz.Pos = 0;  % m
EXOsmiData.CylindricalJoint(1).ID = '[40:-:41]';


%Initialize the PlanarJoint structure array by filling in null values.
EXOsmiData.PlanarJoint(1).Rz.Pos = 0.0;
EXOsmiData.PlanarJoint(1).Px.Pos = 0.0;
EXOsmiData.PlanarJoint(1).Py.Pos = 0.0;
EXOsmiData.PlanarJoint(1).ID = '';

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
EXOsmiData.PlanarJoint(1).Rz.Pos = -15.272647823772671;  % deg
EXOsmiData.PlanarJoint(1).Px.Pos = 0;  % m
EXOsmiData.PlanarJoint(1).Py.Pos = 0;  % m
EXOsmiData.PlanarJoint(1).ID = '[:-:41]';


%Initialize the PrismaticJoint structure array by filling in null values.
EXOsmiData.PrismaticJoint(5).Pz.Pos = 0.0;
EXOsmiData.PrismaticJoint(5).ID = '';

EXOsmiData.PrismaticJoint(1).Pz.Pos = 0;  % m
EXOsmiData.PrismaticJoint(1).ID = '[41:-:47]';

EXOsmiData.PrismaticJoint(2).Pz.Pos = 0;  % m
EXOsmiData.PrismaticJoint(2).ID = '[54:-:63]';

EXOsmiData.PrismaticJoint(3).Pz.Pos = 0;  % m
EXOsmiData.PrismaticJoint(3).ID = '[69:-:70]';

EXOsmiData.PrismaticJoint(4).Pz.Pos = 0;  % m
EXOsmiData.PrismaticJoint(4).ID = '[71:-:72]';

EXOsmiData.PrismaticJoint(5).Pz.Pos = 0;  % m
EXOsmiData.PrismaticJoint(5).ID = '[81:-:82]';


%Initialize the RevoluteJoint structure array by filling in null values.
EXOsmiData.RevoluteJoint(6).Rz.Pos = 0.0;
EXOsmiData.RevoluteJoint(6).ID = '';

EXOsmiData.RevoluteJoint(1).Rz.Pos = 14.041296546754273;  % deg
EXOsmiData.RevoluteJoint(1).ID = '[47:-:48]';

EXOsmiData.RevoluteJoint(2).Rz.Pos = 11.137977600228725;  % deg
EXOsmiData.RevoluteJoint(2).ID = '[48:-:69]';

EXOsmiData.RevoluteJoint(3).Rz.Pos = 3.8987673376753285;  % deg
EXOsmiData.RevoluteJoint(3).ID = '[70:-:71]';

EXOsmiData.RevoluteJoint(4).Rz.Pos = 12.973447672685982;  % deg
EXOsmiData.RevoluteJoint(4).ID = '[72:-:73]';

EXOsmiData.RevoluteJoint(5).Rz.Pos = -9.8016261279966344;  % deg
EXOsmiData.RevoluteJoint(5).ID = '[73:-:81]';

EXOsmiData.RevoluteJoint(6).Rz.Pos = -1.0411998374551061;  % deg
EXOsmiData.RevoluteJoint(6).ID = '[82:-:83]';

