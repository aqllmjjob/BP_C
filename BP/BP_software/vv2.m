function varargout = vv2(varargin)
% VV2 MATLAB code for vv2.fig
%      VV2, by itself, creates a new VV2 or raises the existing
%      singleton*.
%
%      H = VV2 returns the handle to a new VV2 or the handle to
%      the existing singleton*.
%
%      VV2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VV2.M with the given input arguments.
%
%      VV2('Property','Value',...) creates a new VV2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vv2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vv2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vv2

% Last Modified by GUIDE v2.5 03-Jul-2019 10:40:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vv2_OpeningFcn, ...
                   'gui_OutputFcn',  @vv2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before vv2 is made visible.
function vv2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vv2 (see VARARGIN)

% Choose default command line output for vv2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vv2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
i=varargin{1};
err=varargin{2};
drawnow;
plot(handles.axes1,1:i,err);
if i<300
    axis([0 300,0,0.5]);
else
    axis([0 600,0,0.5]);
end
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = vv2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if double(get(gcf,'CurrentCharacter'))==13
    close
    close('vv1')
    main1()
end