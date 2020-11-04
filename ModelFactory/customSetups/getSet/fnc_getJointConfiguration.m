%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function [joint, joint_r, joint_E] = fnc_getJointConfiguration (model,...
    modelJoint_typeName, modelSegment_typeName, inParam_PersonInfo, ...
    segmentID)

% Load model dictionary
dict_definitions;

jointIDXMatch = strmatch (modelJoint_typeName, {JointTypesDictionary(:).name}, 'exact');
if isfield(JointTypesDictionary(jointIDXMatch),'customJoint')
    % This is a custom joint and must be handled in a special way
    joint = [];
else
    joint = JointTypesDictionary(jointIDXMatch).axes;    
end

parentID = model{segmentID}.parentID;
joint_E = eye(3);
switch modelSegment_typeName
    case {'Segment_Pelvis','Segment_Pelvis_Sagittal','Segment_Thigh_Sagittal'}
        joint_r = [0 0 0];
    case 'Segment_Trunk'
        joint_r = [0 0 model{parentID}.length];
    case 'Segment_Torso'
        joint_r = [0 0 0];
    case 'Segment_Thigh_R'
        joint_r = [0 -inParam_PersonInfo.hipCenterWidth/2 0];
    case 'Segment_Thigh_L'
        joint_r = [0 inParam_PersonInfo.hipCenterWidth/2 0];
    case 'Segment_UpperArm_R'
        joint_r = [0 -0.5*inParam_PersonInfo.shoulderCenterWidth ...
            model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case 'Segment_UpperArm_Sagittal'
        joint_r = [0 0 model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case 'Segment_UpperArm_L'
        joint_r = [0  0.5*inParam_PersonInfo.shoulderCenterWidth ...
            model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case {'Segment_Head','Segment_MiddleTrunk','Segment_UpperTrunk',...
            'Segment_Head_Sagittal','Segment_MiddleTrunk_Sagittal',...
            'Segment_UpperTrunk_Sagittal'}
        joint_r = [0 0 model{parentID}.length];
    case {'Segment_LowerArm_R','Segment_LowerArm_L',...
            'Segment_Hand_R','Segment_Hand_L',...
            'Segment_Shank_R','Segment_Shank_L',...
            'Segment_Shank_Sagittal',...
            'Segment_LowerArm_Sagittal','Segment_Hand_Sagittal'}
        joint_r = [0 0 -model{parentID}.length];
    case {'Segment_Foot_R','Segment_Foot_L','Segment_Foot_Sagittal'}
        joint_r = [0 0 -model{parentID}.length];
    case {'Segment_CustomTrunk_Sagittal'}
        joint_r = [0.0 0 model{parentID}.length];
        TrunkBias = -0.011428 + pi/8;
        joint_E = [ cos(TrunkBias)    0 -sin(TrunkBias);
                            0           1       0;
                    sin(TrunkBias)   0   cos(TrunkBias)];
    case {'Segment_L5_Sagittal'}
        joint_r = [-0.0294159825 0.0 0.0903473275];        
        S1PlateTilt = -0.035961 + 0.405905; % (S1 to L5) + (Hip to S1)        
        joint_E = [ cos(S1PlateTilt)    0 -sin(S1PlateTilt);
                            0           1       0;
                    sin(S1PlateTilt)   0  cos(S1PlateTilt)];
    case {'Segment_L4_Sagittal'}
        joint_r = [0.001772097 0 model{parentID}.length];
        L4Bias = -0.154030;
        joint_E = [ cos(L4Bias)    0 -sin(L4Bias);
                            0           1       0;
                    sin(L4Bias)   0   cos(L4Bias)];
    case {'Segment_L3_Sagittal'}
        joint_r = [-0.002670181 0 model{parentID}.length];
        L3Bias = -0.184226;
        joint_E = [ cos(L3Bias)    0 -sin(L3Bias);
            0           1       0;
            sin(L3Bias)   0  cos(L3Bias)];
    case {'Segment_L2_Sagittal'}
        joint_r = [-0.001895634 0 model{parentID}.length];
        L2Bias = -0.225852;
        joint_E = [ cos(L2Bias)    0 -sin(L2Bias);
            0           1       0;
            sin(L2Bias)   0   cos(L2Bias)];
    case {'Segment_L1_Sagittal'}
        joint_r = [0.000946366 0 model{parentID}.length];
        L1Bias = -0.197111;
        joint_E = [ cos(L1Bias)    0 -sin(L1Bias);
            0           1       0;
            sin(L1Bias)   0   cos(L1Bias)];        
    otherwise
        error (['Missing joint configuration for segment type, ', modelSegment_typeName]);
end
