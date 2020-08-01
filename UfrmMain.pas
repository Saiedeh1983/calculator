//*************************************
//*             Calculator            *
//*                                   *
//*  CopyRight© 2004 SalarSoftwares   *
//*   Programmer: Salar Khalilzadeh   *
//*  Web: http://salarsoft.somee.com  *
//*************************************

unit UfrmMain;

interface

uses
  Windows,math, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons,Registry,shellapi, ExtCtrls;

type
  TActionType=(atNone,atPlus,atDif,atDiv,atMup,atSin,atCos,atTan,atExp,atPI
              ,atPlusDif,atMAdd,atMDif,atMR,atMC,atDarsad,atMod,atAnd,atOr,atXor
              ,atFact,atLog,atFrac,atInt,atRoot,atRoot2,atRoot3,atExp2,atHex,atDec);

const
  TActionStr:array[TActionType] of string =(' error ',' + ',' - ',' / ',' * ',' sin ',' cos ',' tan ',' ^ ',' '
                                            ,' ',' ',' ',' ',' ',' % ',' mod ',' and ',' or ',' xor '
                                            ,'',' log ','','',' sqr ','','','','','');
  sVersion ='1.0';
  sRegAddr  ='SOFTWARE\Saeed Softwares\Calculator\'+sVersion;
  sRegMem ='MemValue';
  sMem  ='M';
  sDot  ='.';
  sCError ='The number is too long!';
  sFactorialLong='Can''t do factorial larger of 1754 !';

type
  TfrmMain = class(TForm)
    n0: TSpeedButton;
    n1: TSpeedButton;
    n2: TSpeedButton;
    n3: TSpeedButton;
    n4: TSpeedButton;
    n5: TSpeedButton;
    n6: TSpeedButton;
    n7: TSpeedButton;
    n8: TSpeedButton;
    n9: TSpeedButton;
    edtNumber: TEdit;
    nDot: TSpeedButton;
    nPlusDif: TSpeedButton;
    nMAdd: TSpeedButton;
    nMR: TSpeedButton;
    nMC: TSpeedButton;
    nDiv: TSpeedButton;
    nZarb: TSpeedButton;
    nMenha: TSpeedButton;
    nAlave: TSpeedButton;
    nDarsad: TSpeedButton;
    nEnter: TSpeedButton;
    nCA: TSpeedButton;
    nC: TSpeedButton;
    nBack: TSpeedButton;
    nSin: TSpeedButton;
    ncos: TSpeedButton;
    ntan: TSpeedButton;
    nPi: TSpeedButton;
    edtAction: TEdit;
    lblAction: TLabel;
    ActionList: TActionList;
    Act1: TAction;
    Act2: TAction;
    Act3: TAction;
    Act4: TAction;
    Act5: TAction;
    Act6: TAction;
    Act7: TAction;
    Act8: TAction;
    Act9: TAction;
    Act10: TAction;
    ActDiv: TAction;
    ActPlus: TAction;
    ActDif: TAction;
    ActMup: TAction;
    ActDarsad: TAction;
    ActExp: TAction;
    ActSin: TAction;
    ActTan: TAction;
    actPi: TAction;
    actEnter: TAction;
    ActPlusDif: TAction;
    actDot: TAction;
    actCos: TAction;
    actBack: TAction;
    actClear: TAction;
    actCA: TAction;
    actMAdd: TAction;
    actMDif: TAction;
    actMR: TAction;
    actMC: TAction;
    actMod: TAction;
    actAnd: TAction;
    actOR: TAction;
    actXor: TAction;
    nFact: TSpeedButton;
    actLog: TAction;
    actFact: TAction;
    actFrac: TAction;
    actInt: TAction;
    actRoot: TAction;
    actRoot2: TAction;
    actRoot3: TAction;
    actExp2: TAction;
    actHex: TAction;
    actDec: TAction;
    Label1: TLabel;
    edtmem: TEdit;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actCAExecute(Sender: TObject);
    procedure Act1Execute(Sender: TObject);
    procedure Act2Execute(Sender: TObject);
    procedure Act3Execute(Sender: TObject);
    procedure Act4Execute(Sender: TObject);
    procedure Act5Execute(Sender: TObject);
    procedure Act6Execute(Sender: TObject);
    procedure Act7Execute(Sender: TObject);
    procedure Act8Execute(Sender: TObject);
    procedure Act9Execute(Sender: TObject);
    procedure Act10Execute(Sender: TObject);
    procedure ActDarsadExecute(Sender: TObject);
    procedure ActExpExecute(Sender: TObject);
    procedure ActDifExecute(Sender: TObject);
    procedure ActPlusExecute(Sender: TObject);
    procedure actEnterExecute(Sender: TObject);
    procedure ActSinExecute(Sender: TObject);
    procedure actCosExecute(Sender: TObject);
    procedure ActTanExecute(Sender: TObject);
    procedure actPiExecute(Sender: TObject);
    procedure ActDivExecute(Sender: TObject);
    procedure ActMupExecute(Sender: TObject);
    procedure actBackExecute(Sender: TObject);
    procedure ActPlusDifExecute(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actDotExecute(Sender: TObject);
    procedure actMAddExecute(Sender: TObject);
    procedure actMDifExecute(Sender: TObject);
    procedure actMRExecute(Sender: TObject);
    procedure actMCExecute(Sender: TObject);
    procedure actModExecute(Sender: TObject);
    procedure actXorExecute(Sender: TObject);
    procedure actORExecute(Sender: TObject);
    procedure actAndExecute(Sender: TObject);
    procedure edtActionChange(Sender: TObject);
    procedure edtNumberChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure actFactExecute(Sender: TObject);
    procedure actFracExecute(Sender: TObject);
    procedure actIntExecute(Sender: TObject);
    procedure actRootExecute(Sender: TObject);
    procedure actRoot2Execute(Sender: TObject);
    procedure actRoot3Execute(Sender: TObject);
    procedure actExp2Execute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actHexExecute(Sender: TObject);
    procedure lblSiteMouseEnter(Sender: TObject);
    procedure lblSiteMouseLeave(Sender: TObject);
    procedure lblSiteClick(Sender: TObject);
    procedure actDecExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure DoKeyPress(Key:Char);
    Procedure DoKeyDown(Key:word);
    Function ReadFromReg:String;
    Procedure SaveToReg(str:String);
  end;
  TCalc=class

  private
    fAct:TEdit;
    fNum:Tedit;
    fMem:TEdit;
    Procedure doOnlyActions(act:TActionType);
    Procedure DoOnlySpAction(act:TActionType);
    Function Factorial(N:Extended):Extended;
  public
    ActType:TActionType;
    intFirst:Extended;
    intSecond:Extended;
    intLast:Extended;
    intMem:extended;
    IsSecond:Boolean;
    //strnum:String;
    //strAction:String;
    Procedure AddDot;
    Procedure Clear;
    Procedure ClearAll;
    Procedure Back;
    Procedure Enter;
    Procedure doAction(act:TActionType);
    Procedure DoSpAction(act:TActionType);
    Procedure AddNum(int:extended);
  end;
var
  frmMain: TfrmMain;
  fCalc:TCalc;
  //fHex:boolean;
implementation

{$R *.dfm}

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
DoKeyDown(Key);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
fCalc:=tCalc.Create;
fCalc.fAct:=edtAction;
fCalc.fNum:=edtNumber;
fCalc.fMem:=edtmem;
fCalc.ClearAll;
fCalc.intMem:=strtoFloat(ReadFromReg);
If fCalc.intMem<>0 then
  fCalc.fmem.Text:=smem
else
  fCalc.fmem.Text:='';

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
SaveToReg(floattostr(fCalc.intMem));
fCalc.free;
end;

{ TCalc }

procedure TCalc.AddDot;
begin
  If Pos('.',fNum.text)>0 then
    exit
  else
    fNum.text:=fNum.text+'.';
end;

procedure TCalc.AddNum(int: extended);
var
  str:string;
begin
try
  If self.fNum.text='' then
    self.fNum.text:='0';
  //self.fNum.text:=fNum.text+floattostr(int);
  If ((fNum.text<>'0')and(fNum.text<>'-')and(fNum.text<>'.'))
      and(lowercase(fNum.text)<>lowercase(floattostr(intlast))) then
    str:=fNum.text+floattostr(int)
  else
    str:=floattostr(int);
  If not self.IsSecond then begin
    self.intFirst:= strtoFloat(str);
    If Pos('.',str)>0 then
      fNum.text:=str
    else
      fNum.text:=floattostr(intFirst);
    fact.Text:='';
  end else  begin
    self.intSecond:= strtoFloat(str);
    If Pos('.',str)>0 then
      fNum.text:=str
    else
      fNum.text:=floattostr(intSecond);
  end;                      
  If strtofloat(self.fNum.text)>=99999999999999 then
  begin
    beep;
  //  exit;
  end;
except
  on e:EConvertError do
    raise exception.Create(sCError);
end;
end;

procedure TCalc.Back;
begin
If (fNum.Text='')or((fNum.Text='.')) or (fNum.Text='0') or (fNum.Text='-') then
  exit;

fNum.Text:=copy(fnum.Text,1,length(fNum.Text)-1);

If (fNum.Text='')or((fNum.Text='.')) or (fNum.Text='0') or (fNum.Text='-') then
begin
  fNum.Text:='0';
  exit;
end;

while lowercase(fNum.Text[length(fNum.Text)])='e' do begin
  fNum.Text:=copy(fnum.Text,1,length(fNum.Text)-1);
end;
If self.IsSecond then
  self.intSecond:=strtofloat(fNum.Text)
else 
  self.intFirst:=strtofloat(fNum.Text) ;

end;

procedure TCalc.Clear;
begin
If self.IsSecond then
  self.intSecond:=0
else begin
  self.intFirst:=0 ;
  self.intSecond:=0;
end;
self.fNum.text:='0';
end;

procedure TCalc.ClearAll;
begin
  self.isSecond:=false;
  self.intFirst:=0;
  self.intSecond:=0;
  self.intLast:=0;
  self.fNum.text:='0';
  self.fAct.Text:='';
end;

procedure TCalc.doAction(act: TActionType);
var
  str:string;
begin
self.ActType:=act;
If IsSecond then begin
  fAct.Text:=fact.text+floattostr(intSecond)+TActionStr[act];
  self.doOnlyActions(act);
  self.intFirst:=self.intLast;
  self.intSecond:=0;
  self.fNum.Text:=floattostr(intLast);
  //self.intLast:=0;
end else begin
  If intfirst=0 then  begin
    str:= fnum.Text;
    fnum.Text:='';
    addnum(strtofloat(str));
  end;
  self.IsSecond:=true;
  self.ActType:=act;
  fact.Text:=fnum.Text+TActionStr[act];
  self.intSecond:=0;
  fnum.Text:=floattostr(intLast);//'0';
  //self.intLast:=0;
end;
end;

procedure TCalc.doOnlyActions(act: TActionType);
var
  Int:int64;
  int2:int64;
begin
case act of
  atDarsad:
    Begin
      intLast:=((self.intFirst*self.intSecond)/100);
    end;
  atplus:
    begin
      intLast:= self.intFirst+self.intSecond;
    end;
  atmup:
    begin
      intLast:=intFirst*intsecond;
    end;
  atdiv:
    begin
      intLast:=intFirst/intSecond;
    end;
  atdif:
    begin
      intLast:=intFirst-intSecond;
    end;
  atExp:
    begin
      intLast:=power(intFirst,intSecond);
    end;
  atLog:
    Begin
      intLast:=LogN(intFirst,intSecond);
    end;
  atMod:
    Begin
      int:=trunc(intfirst);
      int2:=trunc(intSecond);
      intLast:=(int mod int2);
      intSecond:=int2;
      intFirst:=int;
    end;
  atAnd:
    Begin
      int:=trunc(intfirst);
      int2:=trunc(intSecond);
      intLast:=(int and int2);
      intSecond:=int2;
      intFirst:=int;
    end;
  atOr:
    Begin
      int:=trunc(intfirst);
      int2:=trunc(intSecond);
      intLast:=(int or int2);
      intSecond:=int2;
      intFirst:=int;
    end;
  atXor:
    Begin
      int:=trunc(intfirst);
      int2:=trunc(intSecond);
      intLast:=(int xor int2);
      intSecond:=int2;
      intFirst:=int;
    end;
  atRoot:
    Begin
      intlast:=power(intfirst,1/intsecond);

    end;
end;
end;

procedure TCalc.DoOnlySpAction(act: TActionType);
var
  str:string;
  temp:integer;
begin
case act of
  atPI:
    begin
      fnum.Text:='';
      self.AddNum(pi);
    end;
  atsin:
    begin
      str:=fnum.Text;
      fnum.Text:='';
      AddNum(sin(strtofloat(str)));
    end;
  atcos:
    begin
      str:=fnum.Text;
      fnum.Text:='';
      AddNum(cos(strtofloat(str)));
    end;
  attan:
    begin
      str:=fnum.Text;
      fnum.Text:='';
      AddNum(tan(strtofloat(str)));
    end;
  atPlusDif:
    begin
      str:=fnum.Text;
      fnum.Text:='';
      AddNum(-strtofloat(str));
    end;
  atMAdd:
    Begin
      intMem:=intMem+strtofloat(fnum.text);
    end;
  atMDif:
    Begin
      intMem:=intMem-strtofloat(fnum.text);
    end;
  atMR:
    Begin
      If intMem<>0 then begin
        If isSecond then
          intsecond:=intmem
        else
          intFirst:=intmem;
      end;
    end;
  atMC:
    Begin
      intMem:=0;
    end;
  atFact:
    Begin
      str:=fnum.Text;
      If strtofloat(str)>1754 then begin
        Raise exception.Create(sFactorialLong);
      end;
      fnum.Text:='';
      self.AddNum(Factorial(strtofloat(str)));
    end;
  atFrac:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      self.AddNum(Frac(strtofloat(str)));
    end;
  atInt:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      self.AddNum(int(strtofloat(str)));
    end;
  atRoot2:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      self.AddNum(power(strtofloat(str),0.5));
    end;
  atRoot3:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      self.AddNum(power(strtofloat(str),1/3));
    end;
  atExp2:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      self.AddNum(power(strtofloat(str),2));
    end;
  atHex:
    Begin
      str:=fnum.Text;
      fnum.Text:='';
      temp:=Trunc(strtofloat(str));
      fnum.Text:=SysUtils.IntToHex(temp,2);
      //fnum.Text:=FloatTostr(UProgramsUnit.IntToAnyBase(str,16));
    end;
  atDec:
    Begin

      //str:=fnum.Text;
      //fnum.Text:='';
      //temp:=Trunc(strtofloat(str));
      //fnum.Text:=FloatTostr(UProgramsUnit.AnyBaseToInt(str,16));
    end;

end;
end;

procedure TCalc.DoSpAction(act: TActionType);
begin
DoOnlySpAction(act);
If intMem<>0 then
  fmem.Text:=smem
else
  fmem.Text:='';
If isSecond then
  fnum.Text:=floattostr(intsecond)
else
  fnum.Text:=floattostr(intFirst);
end;

procedure TCalc.Enter;
begin
  If not self.IsSecond then
  begin
    self.ClearAll;
    exit;
  end;
  self.isSecond:=false;
  doOnlyActions(self.ActType);
  fAct.text:= fAct.text+fNum.Text+' = ';
  fNum.Text:=floattostr(self.intLast);
  fAct.text:= fAct.text+fNum.Text;
  self.intFirst:=0;
  self.intSecond:=0;
  self.intLast:=0;
  self.ActType:=atNone;
end;

procedure TfrmMain.actCAExecute(Sender: TObject);
begin
fCalc.ClearAll;
end;

procedure TfrmMain.Act1Execute(Sender: TObject);
begin
fCalc.AddNum(1 );
end;

procedure TfrmMain.Act2Execute(Sender: TObject);
begin
fCalc.AddNum(2 );
end;

procedure TfrmMain.Act3Execute(Sender: TObject);
begin
fCalc.AddNum(3 );
end;

procedure TfrmMain.Act4Execute(Sender: TObject);
begin
fCalc.AddNum(4 );
end;

procedure TfrmMain.Act5Execute(Sender: TObject);
begin
fCalc.AddNum(5 );
end;

procedure TfrmMain.Act6Execute(Sender: TObject);
begin
fCalc.AddNum(6 );
end;

procedure TfrmMain.Act7Execute(Sender: TObject);
begin
fCalc.AddNum(7 );
end;

procedure TfrmMain.Act8Execute(Sender: TObject);
begin
fCalc.AddNum(8 );
end;

procedure TfrmMain.Act9Execute(Sender: TObject);
begin
fCalc.AddNum(9 );
end;

procedure TfrmMain.Act10Execute(Sender: TObject);
begin
fCalc.AddNum(0 );
end;

procedure TfrmMain.ActDarsadExecute(Sender: TObject);
begin
fCalc.doAction(atDarsad);
end;

procedure TfrmMain.ActExpExecute(Sender: TObject);
begin
fCalc.doAction(atExp);
end;

procedure TfrmMain.ActDifExecute(Sender: TObject);
begin
fCalc.doAction(atdif);
end;

procedure TfrmMain.ActPlusExecute(Sender: TObject);
begin
fCalc.doAction(atplus);
end;

procedure TfrmMain.actEnterExecute(Sender: TObject);
begin
fCalc.Enter;
end;

procedure TfrmMain.ActSinExecute(Sender: TObject);
begin
fCalc.DoSpAction(atsin);

end;

procedure TfrmMain.actCosExecute(Sender: TObject);
begin
fCalc.DoSpAction(atcos);

end;

procedure TfrmMain.ActTanExecute(Sender: TObject);
begin
fCalc.DoSpAction(attan);

end;

procedure TfrmMain.actPiExecute(Sender: TObject);
begin
fCalc.DoSpAction(atpi);

end;

procedure TfrmMain.ActDivExecute(Sender: TObject);
begin
fCalc.doAction(atdiv);

end;

procedure TfrmMain.ActMupExecute(Sender: TObject);
begin
fCalc.doAction(atMup);

end;

procedure TfrmMain.actBackExecute(Sender: TObject);
begin
fCalc.Back;
end;

procedure TfrmMain.ActPlusDifExecute(Sender: TObject);
begin
fCalc.DoSpAction(atPlusDif);

end;

procedure TfrmMain.DoKeyDown(Key: word);
begin
case key of
  VK_RETURN:actEnter.Execute;
  VK_MULTIPLY{*}:actMup.Execute;
  VK_ADD{+}:actplus.Execute;
  VK_DIVIDE{/}:actdiv.Execute;
  VK_SUBTRACT{-}:actDif.Execute;
  VK_BACK:actBaCK.Execute;
  46:actClear.Execute;
  27:actCA.Execute;
  110{dot}  :actdot.Execute;
  VK_NUMPAD0:act10.Execute ;
  VK_NUMPAD1:act1.Execute ;
  VK_NUMPAD2:act2.Execute ;
  VK_NUMPAD3:act3.Execute ;
  VK_NUMPAD4:act4.Execute ;
  VK_NUMPAD5:act5.Execute ;
  VK_NUMPAD6:act6.Execute ;
  VK_NUMPAD7:act7.Execute ;
  VK_NUMPAD8:act8.Execute ;
  VK_NUMPAD9:act9.Execute ;
end;
end;

procedure TfrmMain.actClearExecute(Sender: TObject);
begin
fCalc.Clear;
end;

procedure TfrmMain.actDotExecute(Sender: TObject);
begin
fCalc.AddDot;
end;


procedure TfrmMain.actMAddExecute(Sender: TObject);
begin
fCalc.DoSpAction(atmAdd);
Panel1.Caption:=edtmem.Text;
end;

procedure TfrmMain.actMDifExecute(Sender: TObject);
begin
fCalc.DoSpAction(atmdif);
Panel1.Caption:=edtmem.Text;
end;

procedure TfrmMain.actMRExecute(Sender: TObject);
begin
fCalc.DoSpAction(atmr);
Panel1.Caption:=edtmem.Text;
end;

procedure TfrmMain.actMCExecute(Sender: TObject);
begin
fCalc.DoSpAction(atmc);
Panel1.Caption:=edtmem.Text;

end;

procedure TfrmMain.actModExecute(Sender: TObject);
begin
fcalc.DoAction(atmod);
end;

procedure TfrmMain.actXorExecute(Sender: TObject);
begin
fcalc.DoAction(atxor);

end;

procedure TfrmMain.actORExecute(Sender: TObject);
begin
fcalc.DoAction(ator);

end;

procedure TfrmMain.actAndExecute(Sender: TObject);
begin
fcalc.DoAction(atand);
end;

procedure TfrmMain.edtActionChange(Sender: TObject);
begin
try
  edtAction.OnChange:=nil;
  edtAction.Text:=lowercase(edtAction.Text);
  edtAction.SelStart:=length(edtAction.Text);
finally
  edtAction.OnChange:=edtActionChange;
end;
//edtAction.SelStart:=length(edtAction.Text);
end;

procedure TfrmMain.edtNumberChange(Sender: TObject);
begin
try
  edtNumber.OnChange:=nil;
  edtNumber.Text:=lowercase(edtNumber.Text);
  edtNumber.SelStart:=length(edtNumber.Text);
finally
  edtNumber.OnChange:=edtNumberChange;
end;
end;

procedure TfrmMain.actLogExecute(Sender: TObject);
begin
fcalc.doAction(atLog);
end;

procedure TfrmMain.actFactExecute(Sender: TObject);
begin
fCalc.doSpAction(atFact);
end;

procedure TfrmMain.actFracExecute(Sender: TObject);
begin
fCalc.doSpAction(atFrac);
end;

procedure TfrmMain.actIntExecute(Sender: TObject);
begin
fCalc.doSpAction(atint);
end;

function TCalc.Factorial(N: Extended): Extended;
var
  I:integer;
begin
Result:=1;
for i:=1 to Trunc(N) do begin
  Result:=Result*i;
end;
end;

function TfrmMain.ReadFromReg: String;
var
  fReg:TRegistry;
begin
freg:=TRegistry.Create;
freg.RootKey:=HKEY_LOCAL_MACHINE;
Result:='0';
If freg.OpenKey(sRegAddr,true) then
begin
  If freg.ValueExists(sRegMem) then
    result:=freg.ReadString(sRegMem);
  freg.CloseKey;
end;
freg.Free;
end;

procedure TfrmMain.SaveToReg(str: String);
var
  fReg:TRegistry;
begin
freg:=TRegistry.Create;
freg.RootKey:=HKEY_LOCAL_MACHINE;
If freg.OpenKey(sRegAddr,true) then
begin
  freg.WriteString(sRegMem,str);
  freg.CloseKey;
end;
freg.Free;
end;

procedure TfrmMain.actRootExecute(Sender: TObject);
begin
fcalc.doAction(atRoot);
end;

procedure TfrmMain.actRoot2Execute(Sender: TObject);
begin
fcalc.dospAction(atRoot2);

end;

procedure TfrmMain.actRoot3Execute(Sender: TObject);
begin
fcalc.dospAction(atRoot3);

end;

procedure TfrmMain.actExp2Execute(Sender: TObject);
begin
fcalc.dospAction(atExp2);
end;

procedure TfrmMain.DoKeyPress(Key: Char);
begin
case Lowercase(key+' ')[1] of
//  '0':Act10.Execute  ;
//  '1':Act1.Execute  ;
//  '2':Act2.Execute  ;
//  '3':Act3.Execute  ;
//  '4':Act4.Execute  ;
//  '5':Act5.Execute  ;
//  '6':Act6.Execute  ;
//  '7':Act7.Execute  ;
//  '8':Act8.Execute  ;
//  '9':Act9.Execute  ;

//  '-':ActDif.Execute;
//  '+':ActPlus.Execute;
//  '*':ActMup.Execute;
//  '.':actDot.Execute;
//  '/':ActDiv.Execute;
  '=':actEnter.Execute;
  's':ActSin.Execute;
  'c':actCos.Execute;
  'p':actPi.Execute;
  't':ActTan.Execute;
  '!':actFact.Execute;
  '^':ActExp.Execute;
  '%':actDarsad.Execute;
  'm':actMR.Execute;
  'a':actAnd.Execute;
  'o':actOR.Execute;
  'l':actLog.Execute;
  'i':actint.Execute;
  'x':actXor.Execute;

end;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
DoKeyPress(key);
end;

procedure TfrmMain.actHexExecute(Sender: TObject);
begin
edtNumber.Text:=SysUtils.IntToHex(Trunc(strtofloat(edtNumber.Text)),1);
//actHex.Enabled:=false;
//actDec.Enabled:=true;
end;

procedure TfrmMain.lblSiteMouseEnter(Sender: TObject);
begin
//lblSite.Font.Color:=clRed;
//lblSite.Font.Style:=lblSite.Font.Style+[fsUnderLine];
end;

procedure TfrmMain.lblSiteMouseLeave(Sender: TObject);
begin
//lblSite.Font.Color:=clBlue;
//lblSite.Font.Style:=lblSite.Font.Style-[fsUnderLine];

end;

procedure TfrmMain.lblSiteClick(Sender: TObject);
begin
ShellExecute(handle,nil,'http://salarsoft.somee.com',nil,nil,sw_show);
end;

procedure TfrmMain.actDecExecute(Sender: TObject);
begin

//edtNumber.Text:=FloatTostr(AnyBaseToInt(edtNumber.Text,16));//SysUtils.IntToHex(Trunc(strtofloat(edtNumber.Text)),1);
//actHex.Enabled:=true;
//actDec.Enabled:=false;

end;

end.
