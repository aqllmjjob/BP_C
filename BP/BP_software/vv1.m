function varargout = vv1(varargin)
% VV1 MATLAB code for vv1.fig
%      VV1, by itself, creates a new VV1 or raises the existing
%      singleton*.
%
%      H = VV1 returns the handle to a new VV1 or the handle to
%      the existing singleton*.
%
%      VV1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VV1.M with the given input arguments.
%
%      VV1('Property','Value',...) creates a new VV1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vv1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vv1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vv1

% Last Modified by GUIDE v2.5 02-Jul-2019 16:11:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vv1_OpeningFcn, ...
                   'gui_OutputFcn',  @vv1_OutputFcn, ...
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


% --- Executes just before vv1 is made visible.
function vv1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vv1 (see VARARGIN)

% Choose default command line output for vv1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.dataset=varargin{1};
guidata(hObject, handles);
% handles.dataset=varargin{1};
% guidata(hObject, handles);
% P=handles.dataset(:,1:size(handles.dataset,2)-OutDim)';
% T=handles.dataset(:,size(dataset,2)-OutDim+1:size(dataset,2))';
% [SamIn,minp,maxp,SamOut,mint,maxt]=premnmx(P,T);
% handles.SamIn=
% handles.SamOut
% UIWAIT makes vv1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%背景
ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 ii=imread('123.jpg');
%设置程序的背景图为
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');
 global enter_count;
 global  net;
 global  P;
 global  T;
 global  HiddenUnitNum;
 global  InDim;
 global  OutDim;
 global  MaxEpochs;
 global  B1;
 global  B2;
 global  W1;
 global  W2;
 
 HiddenUnitNum=3;                 %隐节点数
 InDim=5;                          %输入样本维数
 OutDim=3;                         %输出维数
 MaxEpochs=20000;
 enter_count=0;
 dataset=cell2mat(handles.dataset);
 P=dataset(:,1:size(dataset,2)-OutDim)';
 T=dataset(:,size(dataset,2)-OutDim+1:size(dataset,2))';
 [SamIn,minp,maxp,SamOut,mint,maxt]=premnmx(P,T);
 net=newff(minmax(SamIn),[3,3],{'tansig','tansig'},'traingdm');
 W1=0.5*rand(HiddenUnitNum,InDim)-0.1;          %输入层到隐层的初始权值
 B1=0.5*rand(HiddenUnitNum,1)-0.1;              %隐节点初始阈值
 W2=0.5*rand(OutDim,HiddenUnitNum)-0.1;         %隐层到输出层的初始权值
 B2=0.5*rand(OutDim,1)-0.1;                     %输出层初始阈值


% --- Outputs from this function are returned to the command line.
function varargout = vv1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% 

 global enter_count;
 global  net;
 global  P;
 global  T;
 global  SamIn;
 global  HiddenUnitNum;
 global  InDim;
 global  OutDim;
 global  MaxEpochs;
 global  B1;
 global  B2;
 global  W1;
 global  W2;

[SamIn,minp,maxp,SamOut,mint,maxt]=premnmx(P,T);


%创建网络
% net=newff(SamIn,SamOut,[HiddenUnitNum,OutDim],{'tansig'},'traingd');
% net=newff(minmax(SamIn),[3,3],{'tansig','tansig'},'traingdm');
%设置训练次数
net.trainParam.epochs = 1;
%设置收敛误差
net.trainParam.goal=0.05;
net.trainParam.lr=0.08;

net.trainParam.showWindow = false;
net.trainParam.showCommandLine = false;
ErrHistory=[ ];


if(double(get(gcf,'CurrentCharacter'))==13&enter_count==0)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    w1=net.iw{1,1};
    
    set(handles.t11,'ForegroundColor','red');
    set(handles.t12,'ForegroundColor','red');
    set(handles.t13,'ForegroundColor','red');
    set(handles.t21,'ForegroundColor','red');
    set(handles.t22,'ForegroundColor','red');
    set(handles.t23,'ForegroundColor','red');
    set(handles.t31,'ForegroundColor','red');
    set(handles.t32,'ForegroundColor','red');
    set(handles.t33,'ForegroundColor','red');
    set(handles.t41,'ForegroundColor','red');
    set(handles.t42,'ForegroundColor','red');
    set(handles.t43,'ForegroundColor','red');
    set(handles.t51,'ForegroundColor','red');
    set(handles.t52,'ForegroundColor','red');
    set(handles.t53,'ForegroundColor','red');
    % 设置输入层到隐层权值
    set(handles.t11,'String',w1(1,1));
    set(handles.t12,'String',w1(2,1));
    set(handles.t13,'String',w1(3,1));
    set(handles.t21,'String',w1(1,2));
    set(handles.t22,'String',w1(2,2));
    set(handles.t23,'String',w1(3,2));
    set(handles.t31,'String',w1(1,3));
    set(handles.t32,'String',w1(2,3));
    set(handles.t33,'String',w1(3,3));
    set(handles.t41,'String',w1(1,4));
    set(handles.t42,'String',w1(2,4));
    set(handles.t43,'String',w1(3,4));
    set(handles.t51,'String',w1(1,5));
    set(handles.t52,'String',w1(2,5));
    set(handles.t53,'String',w1(3,5));
    
    
    b1=postmnmx(net.b{1}',mint,maxt);
    % 设置输入层到隐层阈值
    set(handles.e1,'ForegroundColor','red');
    set(handles.e2,'ForegroundColor','red');
    set(handles.e3,'ForegroundColor','red');
    set(handles.e1,'String',b1(1,1));
    set(handles.e2,'String',b1(1,2));
    set(handles.e3,'String',b1(1,3));
    
    w2=net.lw{2,1};
    % 设置输入层到隐层权值
    set(handles.e11,'ForegroundColor','red');
    set(handles.e12,'ForegroundColor','red');
    set(handles.e13,'ForegroundColor','red');
    set(handles.e21,'ForegroundColor','red');
    set(handles.e22,'ForegroundColor','red');
    set(handles.e23,'ForegroundColor','red');
    set(handles.e31,'ForegroundColor','red');
    set(handles.e32,'ForegroundColor','red');
    set(handles.e33,'ForegroundColor','red');
    set(handles.e11,'String',w2(1,1));
    set(handles.e12,'String',w2(2,1));
    set(handles.e13,'String',w2(3,1));
    set(handles.e21,'String',w2(1,2));
    set(handles.e22,'String',w2(2,2));
    set(handles.e23,'String',w2(3,2));
    set(handles.e31,'String',w2(1,3));
    set(handles.e32,'String',w2(2,3));
    set(handles.e33,'String',w2(3,3));
    
    b2=postmnmx(net.b{2}',mint,maxt);
    % 设置输入层到隐层阈值
    set(handles.w1,'ForegroundColor','red');
    set(handles.w2,'ForegroundColor','red');
    set(handles.w3,'ForegroundColor','red');
    set(handles.w1,'String',b2(1,1));
    set(handles.w2,'String',b2(1,2));
    set(handles.w3,'String',b2(1,3));

elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==1)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.t11,'ForegroundColor','black');
    set(handles.t12,'ForegroundColor','black');
    set(handles.t13,'ForegroundColor','black');
    set(handles.t21,'ForegroundColor','black');
    set(handles.t22,'ForegroundColor','black');
    set(handles.t23,'ForegroundColor','black');
    set(handles.t31,'ForegroundColor','black');
    set(handles.t32,'ForegroundColor','black');
    set(handles.t33,'ForegroundColor','black');
    set(handles.t41,'ForegroundColor','black');
    set(handles.t42,'ForegroundColor','black');
    set(handles.t43,'ForegroundColor','black');
    set(handles.t51,'ForegroundColor','black');
    set(handles.t52,'ForegroundColor','black');
    set(handles.t53,'ForegroundColor','black');
    set(handles.e1,'ForegroundColor','black');
    set(handles.e2,'ForegroundColor','black');
    set(handles.e3,'ForegroundColor','black');
    set(handles.e11,'ForegroundColor','black');
    set(handles.e12,'ForegroundColor','black');
    set(handles.e13,'ForegroundColor','black');
    set(handles.e21,'ForegroundColor','black');
    set(handles.e22,'ForegroundColor','black');
    set(handles.e23,'ForegroundColor','black');
    set(handles.e31,'ForegroundColor','black');
    set(handles.e32,'ForegroundColor','black');
    set(handles.e33,'ForegroundColor','black');
    set(handles.w1,'ForegroundColor','black');
    set(handles.w2,'ForegroundColor','black');
    set(handles.w3,'ForegroundColor','black');
    
    set(handles.t1,'ForegroundColor','red');
    set(handles.t2,'ForegroundColor','red');
    set(handles.t3,'ForegroundColor','red');
    set(handles.t4,'ForegroundColor','red');
    set(handles.t5,'ForegroundColor','red');
    A=P(1,:);
    set(handles.t1,'String',A(1,1));
    set(handles.t2,'String',A(1,2));
    set(handles.t3,'String',A(1,3));
    set(handles.t4,'String',A(1,4));
    set(handles.t5,'String',A(1,5));
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==2)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.t1,'ForegroundColor','black');
    set(handles.t2,'ForegroundColor','black');
    set(handles.t3,'ForegroundColor','black');
    set(handles.t4,'ForegroundColor','black');
    set(handles.t5,'ForegroundColor','black');
    M=postmnmx(logsig(P(1,1:5)*net.iw{1,1}'+net.b{1}')',mint,maxt);
    set(handles.e1,'String',M(1));
    set(handles.e2,'String',M(2));
    set(handles.e3,'String',M(3));
    set(handles.e1,'ForegroundColor','red');
    set(handles.e2,'ForegroundColor','red');
    set(handles.e3,'ForegroundColor','red');
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==3)   %如果按下的是回车(13)
    set(handles.e1,'ForegroundColor','black');
    set(handles.e2,'ForegroundColor','black');
    set(handles.e3,'ForegroundColor','black');
    enter_count=enter_count+1;
    net.iw{1}=W1;
    net.b{1}=B1;
    net.lw{2,1}=W2;
    net.b{2}=B2;
    [net,tr]=train(net,SamIn,SamOut);
    anewn=sim(net,P(1,1:5)');
    c=postmnmx(anewn,mint,maxt);
    set(handles.w1,'String',c(1));
    set(handles.w2,'String',c(2));
    set(handles.w3,'String',c(3));
    ErrHistory=[ErrHistory tr.best_perf];
    handles.erro=tr.best_perf;
    guidata(hObject, handles);
    set(handles.w1,'ForegroundColor','red');
    set(handles.w2,'ForegroundColor','red');
    set(handles.w3,'ForegroundColor','red');

elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==4)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.w1,'ForegroundColor','black');
    set(handles.w2,'ForegroundColor','black');
    set(handles.w3,'ForegroundColor','black');
    set(handles.text11,'String',handles.erro);
    set(handles.text11,'ForegroundColor','red');
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==5)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.text11,'ForegroundColor','black');
    b1=postmnmx(net.b{2}',mint,maxt);
    % 设置输入层到隐层权值
    set(handles.w1,'String',b1(1));
    set(handles.w2,'String',b1(2));
    set(handles.w3,'String',b1(3));
    set(handles.w1,'ForegroundColor','red');
    set(handles.w2,'ForegroundColor','red');
    set(handles.w3,'ForegroundColor','red');
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==6)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    w2=net.lw{2,1};
    set(handles.w1,'ForegroundColor','black');
    set(handles.w2,'ForegroundColor','black');
    set(handles.w3,'ForegroundColor','black');
    % 设置输入层到隐层权值
    set(handles.e11,'String',w2(1,1));
    set(handles.e12,'String',w2(2,1));
    set(handles.e13,'String',w2(3,1));
    set(handles.e21,'String',w2(1,2));
    set(handles.e22,'String',w2(2,2));
    set(handles.e23,'String',w2(3,2));
    set(handles.e31,'String',w2(1,3));
    set(handles.e32,'String',w2(2,3));
    set(handles.e33,'String',w2(3,3));
    set(handles.e11,'ForegroundColor','red');
    set(handles.e12,'ForegroundColor','red');
    set(handles.e13,'ForegroundColor','red');
    set(handles.e21,'ForegroundColor','red');
    set(handles.e22,'ForegroundColor','red');
    set(handles.e23,'ForegroundColor','red');
    set(handles.e31,'ForegroundColor','red');
    set(handles.e32,'ForegroundColor','red');
    set(handles.e33,'ForegroundColor','red');
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==7)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.e11,'ForegroundColor','black');
    set(handles.e12,'ForegroundColor','black');
    set(handles.e13,'ForegroundColor','black');
    set(handles.e21,'ForegroundColor','black');
    set(handles.e22,'ForegroundColor','black');
    set(handles.e23,'ForegroundColor','black');
    set(handles.e31,'ForegroundColor','black');
    set(handles.e32,'ForegroundColor','black');
    set(handles.e33,'ForegroundColor','black');
    b1=postmnmx(net.b{1}',mint,maxt);
    % 设置输入层到隐层权值
    set(handles.e1,'String',b1(1,1));
    set(handles.e2,'String',b1(1,2));
    set(handles.e3,'String',b1(1,3));
    set(handles.e1,'ForegroundColor','red');
    set(handles.e2,'ForegroundColor','red');
    set(handles.e3,'ForegroundColor','red');

elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==8)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.e1,'ForegroundColor','black');
    set(handles.e2,'ForegroundColor','black');
    set(handles.e3,'ForegroundColor','black');
    w1=net.iw{1,1};
    % 设置输入层到隐层权值
    set(handles.t11,'String',w1(1,1));
    set(handles.t12,'String',w1(2,1));
    set(handles.t13,'String',w1(3,1));
    set(handles.t21,'String',w1(1,2));
    set(handles.t22,'String',w1(2,2));
    set(handles.t23,'String',w1(3,2));
    set(handles.t31,'String',w1(1,3));
    set(handles.t32,'String',w1(2,3));
    set(handles.t33,'String',w1(3,3));
    set(handles.t41,'String',w1(1,4));
    set(handles.t42,'String',w1(2,4));
    set(handles.t43,'String',w1(3,4));
    set(handles.t51,'String',w1(1,5));
    set(handles.t52,'String',w1(2,5));
    set(handles.t53,'String',w1(3,5));
    set(handles.t11,'ForegroundColor','red');
    set(handles.t12,'ForegroundColor','red');
    set(handles.t13,'ForegroundColor','red');
    set(handles.t21,'ForegroundColor','red');
    set(handles.t22,'ForegroundColor','red');
    set(handles.t23,'ForegroundColor','red');
    set(handles.t31,'ForegroundColor','red');
    set(handles.t32,'ForegroundColor','red');
    set(handles.t33,'ForegroundColor','red');
    set(handles.t41,'ForegroundColor','red');
    set(handles.t42,'ForegroundColor','red');
    set(handles.t43,'ForegroundColor','red');
    set(handles.t51,'ForegroundColor','red');
    set(handles.t52,'ForegroundColor','red');
    set(handles.t53,'ForegroundColor','red');
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==9)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.t11,'ForegroundColor','black');
    set(handles.t12,'ForegroundColor','black');
    set(handles.t13,'ForegroundColor','black');
    set(handles.t21,'ForegroundColor','black');
    set(handles.t22,'ForegroundColor','black');
    set(handles.t23,'ForegroundColor','black');
    set(handles.t31,'ForegroundColor','black');
    set(handles.t32,'ForegroundColor','black');
    set(handles.t33,'ForegroundColor','black');
    set(handles.t41,'ForegroundColor','black');
    set(handles.t42,'ForegroundColor','black');
    set(handles.t43,'ForegroundColor','black');
    set(handles.t51,'ForegroundColor','black');
    set(handles.t52,'ForegroundColor','black');
    set(handles.t53,'ForegroundColor','black');
    M=postmnmx(logsig(P(1,1:5)*net.iw{1,1}'+net.b{1}')',mint,maxt);
    set(handles.e1,'String',M(1));
    set(handles.e2,'String',M(2));
    set(handles.e3,'String',M(3));
    set(handles.e1,'ForegroundColor','red');
    set(handles.e2,'ForegroundColor','red');
    set(handles.e3,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==10)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.e1,'ForegroundColor','black');
    set(handles.e2,'ForegroundColor','black');
    set(handles.e3,'ForegroundColor','black');
    [net,tr]=train(net,SamIn,SamOut);
    anewn=sim(net,P(1,1:5)');
    c=postmnmx(anewn,mint,maxt);
    set(handles.w1,'String',c(1));
    set(handles.w2,'String',c(2));
    set(handles.w3,'String',c(3));
    set(handles.w1,'ForegroundColor','red');
    set(handles.w2,'ForegroundColor','red');
    set(handles.w3,'ForegroundColor','red');
    ErrHistory=[ErrHistory tr.best_perf];
    handles.erro=tr.best_perf;
    guidata(hObject, handles);
    
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==11)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.w1,'ForegroundColor','black');
    set(handles.w2,'ForegroundColor','black');
    set(handles.w3,'ForegroundColor','black');
    set(handles.text11,'String',handles.erro);
    set(handles.text11,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==12)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.text11,'ForegroundColor','black');
    b1=postmnmx(net.b{2}',mint,maxt);
    % 设置输入层到隐层权值
    set(handles.w1,'String',b1(1));
    set(handles.w2,'String',b1(2));
    set(handles.w3,'String',b1(3));
    set(handles.w1,'ForegroundColor','red');
    set(handles.w2,'ForegroundColor','red');
    set(handles.w3,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==13)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.w1,'ForegroundColor','black');
    set(handles.w2,'ForegroundColor','black');
    set(handles.w3,'ForegroundColor','black');
    w2=net.lw{2,1};
    % 设置输入层到隐层权值
    set(handles.e11,'String',w2(1,1));
    set(handles.e12,'String',w2(2,1));
    set(handles.e13,'String',w2(3,1));
    set(handles.e21,'String',w2(1,2));
    set(handles.e22,'String',w2(2,2));
    set(handles.e23,'String',w2(3,2));
    set(handles.e31,'String',w2(1,3));
    set(handles.e32,'String',w2(2,3));
    set(handles.e33,'String',w2(3,3));
    set(handles.e11,'ForegroundColor','red');
    set(handles.e12,'ForegroundColor','red');
    set(handles.e13,'ForegroundColor','red');
    set(handles.e21,'ForegroundColor','red');
    set(handles.e22,'ForegroundColor','red');
    set(handles.e23,'ForegroundColor','red');
    set(handles.e31,'ForegroundColor','red');
    set(handles.e32,'ForegroundColor','red');
    set(handles.e33,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==14)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.e11,'ForegroundColor','black');
    set(handles.e12,'ForegroundColor','black');
    set(handles.e13,'ForegroundColor','black');
    set(handles.e21,'ForegroundColor','black');
    set(handles.e22,'ForegroundColor','black');
    set(handles.e23,'ForegroundColor','black');
    set(handles.e31,'ForegroundColor','black');
    set(handles.e32,'ForegroundColor','black');
    set(handles.e33,'ForegroundColor','black');
    % 设置输入层到隐层权值
    b1=postmnmx(net.b{1}',mint,maxt);
    % 设置输入层到隐层权值
    set(handles.e1,'String',b1(1,1));
    set(handles.e2,'String',b1(1,2));
    set(handles.e3,'String',b1(1,3));
    set(handles.e1,'ForegroundColor','red');
    set(handles.e2,'ForegroundColor','red');
    set(handles.e3,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==15)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.e1,'ForegroundColor','black');
    set(handles.e2,'ForegroundColor','black');
    set(handles.e3,'ForegroundColor','black');
    w1=net.iw{1,1};
    % 设置输入层到隐层权值
    set(handles.t11,'String',w1(1,1));
    set(handles.t12,'String',w1(2,1));
    set(handles.t13,'String',w1(3,1));
    set(handles.t21,'String',w1(1,2));
    set(handles.t22,'String',w1(2,2));
    set(handles.t23,'String',w1(3,2));
    set(handles.t31,'String',w1(1,3));
    set(handles.t32,'String',w1(2,3));
    set(handles.t33,'String',w1(3,3));
    set(handles.t41,'String',w1(1,4));
    set(handles.t42,'String',w1(2,4));
    set(handles.t43,'String',w1(3,4));
    set(handles.t51,'String',w1(1,5));
    set(handles.t52,'String',w1(2,5));
    set(handles.t53,'String',w1(3,5));
    set(handles.t11,'ForegroundColor','red');
    set(handles.t12,'ForegroundColor','red');
    set(handles.t13,'ForegroundColor','red');
    set(handles.t21,'ForegroundColor','red');
    set(handles.t22,'ForegroundColor','red');
    set(handles.t23,'ForegroundColor','red');
    set(handles.t31,'ForegroundColor','red');
    set(handles.t32,'ForegroundColor','red');
    set(handles.t33,'ForegroundColor','red');
    set(handles.t41,'ForegroundColor','red');
    set(handles.t42,'ForegroundColor','red');
    set(handles.t43,'ForegroundColor','red');
    set(handles.t51,'ForegroundColor','red');
    set(handles.t52,'ForegroundColor','red');
    set(handles.t53,'ForegroundColor','red');
elseif(double(get(gcf,'CurrentCharacter'))==13&enter_count==16)   %如果按下的是回车(13)
    enter_count=enter_count+1;
    set(handles.t11,'ForegroundColor','black');
    set(handles.t12,'ForegroundColor','black');
    set(handles.t13,'ForegroundColor','black');
    set(handles.t21,'ForegroundColor','black');
    set(handles.t22,'ForegroundColor','black');
    set(handles.t23,'ForegroundColor','black');
    set(handles.t31,'ForegroundColor','black');
    set(handles.t32,'ForegroundColor','black');
    set(handles.t33,'ForegroundColor','black');
    set(handles.t41,'ForegroundColor','black');
    set(handles.t42,'ForegroundColor','black');
    set(handles.t43,'ForegroundColor','black');
    set(handles.t51,'ForegroundColor','black');
    set(handles.t52,'ForegroundColor','black');
    set(handles.t53,'ForegroundColor','black');
    for i=1:MaxEpochs
        net.iw{1}=W1;
        net.b{1}=B1;
        net.lw{2,1}=W2;
        net.b{2}=B2;
        [net,tr]=train(net,SamIn,SamOut);
        W1=net.iw{1};  B1=net.b{1};  W2=net.lw{2,1};  B2=net.b{2};
        ErrHistory=[ErrHistory tr.best_perf];
        handles.erro=tr.best_perf;
        guidata(hObject, handles);
        vv2(i,ErrHistory);
        if tr.best_perf<net.trainParam.goal
            break;
        end
        w1=net.iw{1,1};
        % 设置输入层到隐层权值
        set(handles.t11,'String',w1(1,1));
        set(handles.t12,'String',w1(2,1));
        set(handles.t13,'String',w1(3,1));
        set(handles.t21,'String',w1(1,2));
        set(handles.t22,'String',w1(2,2));
        set(handles.t23,'String',w1(3,2));
        set(handles.t31,'String',w1(1,3));
        set(handles.t32,'String',w1(2,3));
        set(handles.t33,'String',w1(3,3));
        set(handles.t41,'String',w1(1,4));
        set(handles.t42,'String',w1(2,4));
        set(handles.t43,'String',w1(3,4));
        set(handles.t51,'String',w1(1,5));
        set(handles.t52,'String',w1(2,5));
        set(handles.t53,'String',w1(3,5));
        b1=postmnmx(net.b{2}',mint,maxt);
        % 设置输入层到隐层权值
        set(handles.w1,'String',b1(1));
        set(handles.w2,'String',b1(2));
        set(handles.w3,'String',b1(3));
        b1=postmnmx(net.b{1}',mint,maxt);
        % 设置输入层到隐层权值
        set(handles.e1,'String',b1(1,1));
        set(handles.e2,'String',b1(1,2));
        set(handles.e3,'String',b1(1,3));
        w2=net.lw{2,1};
        % 设置输入层到隐层权值
        set(handles.e11,'String',w2(1,1));
        set(handles.e12,'String',w2(2,1));
        set(handles.e13,'String',w2(3,1));
        set(handles.e21,'String',w2(1,2));
        set(handles.e22,'String',w2(2,2));
        set(handles.e23,'String',w2(3,2));
        set(handles.e31,'String',w2(1,3));
        set(handles.e32,'String',w2(2,3));
        set(handles.e33,'String',w2(3,3));
        set(handles.text11,'String',handles.erro);
        pause(0.0001)
    end
end
