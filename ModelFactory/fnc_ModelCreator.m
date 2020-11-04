function [humanModel, humanAnthropometry] = ...
    fnc_ModelCreator (EnvironmentSetupFile)

%% Functionalised version of ModelFactory's ModelCreator script
%% Copyright statement below applies

%% ModelFactory
% Copyright (c) 2020 Manish Sreenivasa
% <manishs@uow.edu.au>, University of Wollongong
%
% Licensed under the zlib license. See LICENSE for more details.

%% General Description
% The ModelFactory toolkit is a set of scripts in Matlab(R)/Octave that
% can be used to create models of humans and human-centered devices such as
% exoskeletons. By default a graphical user interface is included that
% works on Matlab (tested on Matlab 2017a(R)), and a text based interface
% for Matlab(R)/ Octave (tested on Octave 4.2.1, https://ftp.gnu.org/gnu/octave/).
%
% Developments of the toolkit can be followed on:
%   https://github.com/manishsreenivasa/ModelFactory

%% Set path to Modelfactory's folders
disp (['Processing environment setup file :: ', EnvironmentSetupFile]);
basePathIdx = strfind (EnvironmentSetupFile,'\');
basePath = EnvironmentSetupFile(1:basePathIdx(end));
EnvironmentSetup = fnc_readEnvironmentSetupFile (EnvironmentSetupFile);

%% Read dictionary
dict_definitions;

%% Setup human model
% Load human anthropometry
humanAnthropometry = fnc_readHumanAnthropometry...
    ([basePath,EnvironmentSetup.humanModel_AnthropometryFile]);
% Load human model description
humanModelDescription = fnc_readHumanModelDescriptionFile...
    ([basePath,EnvironmentSetup.humanModel_DescriptionFile]);
customSegmentLengthsDescription = [];

% Set human model scaling algorithm
[scalingAlgorithm, bConsistencyError] = ...
    fnc_setHumanScalingAlgorithm (humanModelDescription,...
    EnvironmentSetup.humanModel_ScalingAlgorithmChoice,...
    humanAnthropometry,...
    customSegmentLengthsDescription,...
    EnvironmentSetup.humanModel_TypeMeshes);

% Scroll through human model description and create corresponding model
humanModel = fnc_createHumanModel (humanModelDescription,...
    scalingAlgorithm,...
    humanAnthropometry,...
    EnvironmentSetup.AddMarkers,...
    []);

%% Setup all objects (if any)
objects = [];
for objID = 1:EnvironmentSetup.nObjects
    
    % Load object description
    objects(objID).modelDescription = fnc_readObjectModelDescriptionFile...
        ([basePath,EnvironmentSetup.objects(objID).modelDescriptionFile]);
    
    % Compute object properties from chosen setup
    [objects(objID).modelSetup, bConsistencyError] = fnc_getObjectSetup ...
        (humanModel, EnvironmentSetup.objects(objID).modelSetupChoice);
    
    % Iterate through object components
    if isempty (EnvironmentSetup.UseCustomMarkers)
        objects(objID).objectModel = fnc_createObjectModel (...
            objects(objID).modelDescription, ...
            objects(objID).modelSetup, ...
            humanAnthropometry, ...
            EnvironmentSetup.AddMarkers, ...
            []);
    else
        customMarkerDescription = fnc_readCustomMarkerFile([basePath,...
            EnvironmentSetup.UseCustomMarkers]);
        objects(objID).objectModel = fnc_createObjectModel (...
            objects(objID).modelDescription, ...
            objects(objID).modelSetup, ...
            humanAnthropometry, ...
            EnvironmentSetup.AddMarkers, ...
            customMarkerDescription);
    end
    
    if ~isempty(EnvironmentSetup.objects(objID).modelMassProperties)
        % Compute mass properties based on mass property file
        objects(objID).objectModel = fnc_computeObjectMassProperties (...
            objects(objID).objectModel,...
            [basePath,EnvironmentSetup.objects(objID).modelMassProperties]);
    end
end

%% Populate human metadata
metadata.scaling_used           = ...
    EnvironmentSetup.humanModel_ScalingAlgorithmChoice;
metadata.subject_age            = humanAnthropometry.age;
metadata.subject_height         = humanAnthropometry.height;
metadata.subject_weight         = humanAnthropometry.weight;
metadata.subject_gender         = humanAnthropometry.gender;
metadata.subject_pelvisWidth    = humanAnthropometry.pelvisWidth;
metadata.subject_hipCenterWidth = humanAnthropometry.hipCenterWidth;
metadata.subject_shoulderCenterWidth = ...
    humanAnthropometry.shoulderCenterWidth ;
metadata.subject_heelAnkleXOffset    = humanAnthropometry.heelAnkleXOffset;
metadata.subject_heelAnkleZOffset    = humanAnthropometry.heelAnkleZOffset;
metadata.subject_footWidth           = humanAnthropometry.footWidth;
metadata.subject_shoulderNeckZOffset = ...
    humanAnthropometry.shoulderNeckZOffset;