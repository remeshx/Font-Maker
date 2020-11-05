unit Preview_UN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TPer_Form = class(TForm)
    PaintBox: TPaintBox;
    procedure PaintBoxClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Per_Form: TPer_Form;

implementation

{$R *.DFM}
Uses Graphic_Font,Main_Un;

procedure TPer_Form.PaintBoxClick(Sender: TObject);
begin
 Per_Form.click;
end;

procedure TPer_Form.PaintBoxPaint(Sender: TObject);
begin
 Try
  If Length(MainForm.FontArr) <> 0 Then DrawArray(PaintBox.Canvas,MainForm.currentShow,MainForm.FontArr,PaintBox.Width,PaintBox.Height);
 Except
 End; 
end;

end.
