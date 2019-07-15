function varargout = show_error1(varargin)
% SHOW_ERROR1 MATLAB code for show_error1.fig
%      SHOW_ERROR1, by itself, creates a new SHOW_ERROR1 or raises the existing
%      singleton*.
%
%      H = SHOW_ERROR1 returns the handle to a new SHOW_ERROR1 or the handle to
%      the existing singleton*.
%
%      SHOW_ERROR1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_ERROR1.M with the given input arguments.
%
%      SHOW_ERROR1('Property','Value',...) creates a new SHOW_ERROR1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_error1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_error1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_error1

% Last Modified by GUIDE v2.5 02-Jul-2019 15:09:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_error1_OpeningFcn, ...
                   'gui_OutputFcn',  @show_error1_OutputFcn, ...
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


% --- Executes just before show_error1 is made visible.
function show_error1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_error1 (see VARARGIN)

% Choose default command line output for show_error1
handles.output = hObject;
%
GetData=getappdata(0,'GetData');
shuRuCeng= getappdata(0,'shuRuCeng');
yinCangCeng= getappdata(0,'yinCangCeng');
shuChuCeng= getappdata(0,'shuChuCeng');
xueXiXiaoLv= getappdata(0,'xueXiXiaoLv');
yunXuWuCha= getappdata(0,'yunXuWuCha');
zuiDaXunLianCiShu= getappdata(0,'zuiDaXunLianCiShu');
 Data=GetData';
 X=Data(1:shuRuCeng ,:);
 Y=Data(shuRuCeng+1:end,:);
 % 数据归一化处理
 [inputn,xs]=mapminmax(X);
 [outputn,ys]=mapminmax(Y);
 % BP网络建立与训练
 net=newff(minmax(X),[yinCangCeng,shuChuCeng],{'tansig','purelin'},'traingdm');
 net.trainParam.lr= xueXiXiaoLv;%学习效率
 net.trainParam.mc=0.9;%动量因子
 net.trainParam.epochs=zuiDaXunLianCiShu;%最大迭代次数
 net.trainParam.goal= yunXuWuCha; %训练误差精度
 net.trainParam.showWindow=0;%频率
 [net,tr]=train(net,inputn,outputn);
 setappdata(0,'CollectData',tr.perf);
 setappdata(0,'TR',tr);
 setappdata(0,'NET',net);
 setappdata(0,'inputn',xs);
 setappdata(0,'outputn',ys);            
                
% 
h=getappdata(0,'CollectData');
axes(handles.axes1);
plot([1:length(h)],h,'LineWidth',3,'MarkerSize',5);
x=0;
axis([x x+500 0.001 0.1]);
while 1
    if x>max(length(h))
        break;
    end
    x=x+100;
    axis([0 x+500 0.001 0.1]);
    pause(0.1);
end



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show_error1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_error1_OutputFcn(hObject, eventdata, handles) 
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
close();
predict_window();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%返回
close
xunLianYuYanShi()
