function varargout = v1(varargin)
% V1 MATLAB code for v1.fig
%      V1, by itself, creates a new V1 or raises the existing
%      singleton*.
%
%      H = V1 returns the handle to a new V1 or the handle to
%      the existing singleton*.
%
%      V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in V1.M with the given input arguments.
%
%      V1('Property','Value',...) creates a new V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help v1

% Last Modified by GUIDE v2.5 17-Jun-2019 17:02:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @v1_OpeningFcn, ...
                   'gui_OutputFcn',  @v1_OutputFcn, ...
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


% --- Executes just before v1 is made visible.
function v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to v1 (see VARARGIN)

% Choose default command line output for v1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[name,path,q]=uigetfile({'*.xlsx';'*.xls'});
if q>0
    filep=strcat(path,name);
    Q=xlsread(filep);
    close
    v2(Q)
end

