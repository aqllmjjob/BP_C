function varargout = show_weight(varargin)
% SHOW_WEIGHT MATLAB code for show_weight.fig
%      SHOW_WEIGHT, by itself, creates a new SHOW_WEIGHT or raises the existing
%      singleton*.
%
%      H = SHOW_WEIGHT returns the handle to a new SHOW_WEIGHT or the handle to
%      the existing singleton*.
%
%      SHOW_WEIGHT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_WEIGHT.M with the given input arguments.
%
%      SHOW_WEIGHT('Property','Value',...) creates a new SHOW_WEIGHT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_weight_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_weight_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_weight

% Last Modified by GUIDE v2.5 02-Jul-2019 17:17:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_weight_OpeningFcn, ...
                   'gui_OutputFcn',  @show_weight_OutputFcn, ...
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


% --- Executes just before show_weight is made visible.
function show_weight_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_weight (see VARARGIN)

% Choose default command line output for show_weight
handles.output = hObject;

net=getappdata(0,'NET');
%输入层到隐层的权值
IW=net.iw{1,1};
%隐层到输出层的权值
LW=net.lw{2,1};
[m,n]=size(LW);

% % 
% bg=axes('units','normalized','pos',[0 0 1 1]);
% uistack(bg,'down');
% % ii=imread('BG1.png');
% %
% % image(ii);
% colormap gray
% set(bg,'handlevisibility','off','visible','off');

%输入层到隐层的权值
set(handles.uitable1,'data',IW');
% 隐层到输出层的权值
set(handles.uitable2,'data',[[1:n]',LW']);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show_weight wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = show_weight_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
close
xunLianYuYanShi()

% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
close
TreatData()
