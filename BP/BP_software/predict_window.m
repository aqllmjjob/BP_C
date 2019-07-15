function varargout = predict_window(varargin)
%PREDICT_WINDOW M-file for predict_window.fig
%      PREDICT_WINDOW, by itself, creates a new PREDICT_WINDOW or raises the existing
%      singleton*.
%
%      H = PREDICT_WINDOW returns the handle to a new PREDICT_WINDOW or the handle to
%      the existing singleton*.
%
%      PREDICT_WINDOW('Property','Value',...) creates a new PREDICT_WINDOW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to predict_window_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PREDICT_WINDOW('CALLBACK') and PREDICT_WINDOW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PREDICT_WINDOW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help predict_window

% Last Modified by GUIDE v2.5 02-Jul-2019 15:16:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @predict_window_OpeningFcn, ...
                   'gui_OutputFcn',  @predict_window_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before predict_window is made visible.
function predict_window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for predict_window
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes predict_window wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = predict_window_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in importbutton1.
function importbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to importbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of importbutton1
global GetData flag
try
  
    [filename,filepath]=uigetfile('*.xlsx','OpenFile');
    %file=[filename,filepath];
    %fid=fopen(file,'rt');%read txt
    filep=strcat(filepath,filename);
    % filep
    % workImg=imread(filep);
    
    GetData = xlsread(filep,'测试数据');
    flag=flag+1;
%     Notice;
msgbox('样本数据导入成功！')
catch ErrorInfo
    errordlg(ErrorInfo.message);
end

% --- Executes on button press in predictbutton2.
function predictbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to predictbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of predictbutton2
global GetData flag
if flag==0
    errordlg(ErrorInfo.message);
else

    %     tr=getappdata(0,'TR');
    net=getappdata(0,'NET');
    inputn=getappdata(0,'inputn');
    outputn=getappdata(0,'outputn');
    data=GetData';
    X=data(1:9,:);
    Y=data(10,:);
    
    InputData=mapminmax('apply',X,inputn);
    B=sim(net,InputData);
    OutputData=mapminmax('reverse',B,outputn);
    % 
    setappdata(0,'Outputdata',OutputData);
    setappdata(0,'ActualValue',Y);
    close();
    % 
    TreatData(); 
end


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton3
close
show_error1()
