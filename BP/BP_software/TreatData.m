function varargout = TreatData(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TreatData_OpeningFcn, ...
                   'gui_OutputFcn',  @TreatData_OutputFcn, ...
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

% 
function TreatData_OpeningFcn(hObject, eventdata, handles, varargin)
global GetData
handles.output = hObject;
data1 = GetData(:,10)';
getGuess=getappdata(0,'Outputdata');
% getGuess = ceil(getGuess)
ActualValue= getappdata(0,'ActualValue');
[m,n]=size(getGuess');
set(handles.GuessData,'data',[[1:m]',getGuess',ActualValue']);

% 
axes(handles.axes1);
plot([1:length(getGuess)],getGuess,'r.');
hold on
plot([1:length(ActualValue)],ActualValue,'*');
% plot(getGuess,[1:length(getGuess)],'r.',2,1:length(getGuess),'b',4,1:length(getGuess),'k')
% legend('ActualValue','PredictValue');
% x = 0;
%axis([1.6 4.5 x x+190]);

% 
 getGuessData=getGuess';
 ActualValue=ActualValue';
 getGuessData = mat2cell(getGuessData,ones(1,size(getGuessData,1)),ones(1,size(getGuessData,2)));
 ActualValue = mat2cell(ActualValue,ones(1,size(ActualValue,1)),ones(1,size(ActualValue,2)));
% no = num2cell(no1');
 Num=0;
% data1 = num2cell(data1');
% for i=1:m    
%    Num=Num+1;
%    getGuessData{i} = ['<html><FONT size=5 color=#ff0000">' num2str(getGuessData{i},'%10.0f') '</Font></html>'];
%    ActualValue{i} = ['<html><FONT size=5 color=#ff0000">' num2str(ActualValue{i},'%10.0f') '</Font></html>'];
% end
% setappdata(0,'m',m);
% setappdata(0,'Num',Num);
% setappdata(0,'rate',Num/m);
% set(handles.CalculateData,'data',[no getGuessData ActualValue]);

% pause(2)
% Rate;
% set(handles.CalculateData,'data',[[1:m]',getGuessData,ActualValue]);

% Update handles structure
guidata(hObject, handles);


function varargout = TreatData_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function Goon_Callback(hObject, eventdata, handles)
close();
show_weight()


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
predict_window()
