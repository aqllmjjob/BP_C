function varargout = show_wucha(varargin)
% SHOW_WUCHA MATLAB code for show_wucha.fig
%      SHOW_WUCHA, by itself, creates a new SHOW_WUCHA or raises the existing
%      singleton*.
%
%      H = SHOW_WUCHA returns the handle to a new SHOW_WUCHA or the handle to
%      the existing singleton*.
%
%      SHOW_WUCHA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_WUCHA.M with the given input arguments.
%
%      SHOW_WUCHA('Property','Value',...) creates a new SHOW_WUCHA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_wucha_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_wucha_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_wucha

% Last Modified by GUIDE v2.5 03-Jul-2019 10:22:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_wucha_OpeningFcn, ...
                   'gui_OutputFcn',  @show_wucha_OutputFcn, ...
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


% --- Executes just before show_wucha is made visible.
function show_wucha_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_wucha (see VARARGIN)

% Choose default command line output for show_wucha
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show_wucha wait for user response (see UIRESUME)
% uiwait(handles.figure1);
getDatas=getappdata(0,'getDatas');
Sum = getappdata(0,'Sum');
getDatas = getDatas(1:Sum,:);
set(handles.uitable1,'data',getDatas);

% --- Outputs from this function are returned to the command line.
function varargout = show_wucha_OutputFcn(hObject, eventdata, handles) 
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
close
xunLianYuYanShi()

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
show_error1()

