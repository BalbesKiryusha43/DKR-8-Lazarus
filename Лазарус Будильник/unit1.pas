unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, mmsystem;

type

  { TForm1 }

  TForm1 = class(TForm)
Button1: TButton;
Button2: TButton;
Edit1: TEdit;
Image1: TImage;
Label1: TLabel;
Timer1: TTimer;
  const
  SoundFile = 'C:\Users\79991\Desktop\МДК 05. 02. ЕГ\Лазарус Будильник\звук.wav';
procedure Button1Click(Sender: TObject);
procedure Button2Click(Sender: TObject);
procedure Edit1Change(Sender: TObject);
procedure FormCreate(Sender: TObject);
procedure Image1Click(Sender: TObject);
procedure Label1Click(Sender: TObject);
procedure Timer1Timer(Sender: TObject);
private
FAlarmTime: TTime;
FAlarmEnabled: Boolean;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FAlarmEnabled := False;
  Image1.Picture.LoadFromFile('корней.jpg');
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
Hour, Min, Sec, MSec: Word;
begin
if TryStrToTime(Edit1.Text, FAlarmTime) then
begin
DecodeTime(FAlarmTime, Hour, Min, Sec, MSec);
Label1.Caption := 'Корней установлен на ' + Format('%d:%.2d', [Hour, Min]);
FAlarmEnabled := True;
Button1.Enabled := False;
end
else
ShowMessage('Введите время в формате "ЧЧ:ММ"');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if FAlarmEnabled then
  begin
    FAlarmEnabled := False;
    Button1.Enabled := True;
    Label1.Caption := '';
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin
if FAlarmEnabled then
begin
FAlarmEnabled := False;
Button1.Enabled := True;
Label1.Caption := '';
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Time, Hour, Min, Sec, MSec);

  if FAlarmEnabled and (Time >= FAlarmTime) then
  begin
    FAlarmEnabled := False;
    Button1.Enabled := True;
    Label1.Caption := 'Корней сработал!';
    PlaySound(PChar(SoundFile), 0, SND_ASYNC or SND_FILENAME);
    ShowMessage('Корней сработал!');
  end;
end;
end.

