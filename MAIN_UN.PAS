unit Main_Un;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, StretchImage, Menus,
  PictureConverter, Gauges, ExtDlgs, customScrollBar,Graphic_Font, AppEvnts;

type
  TMainForm = class(TForm)
    Titel_Active_Img: TImage;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Animate1: TAnimate;
    Bevel2: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    First_Sp: TSpeedButton;
    Per_Sp: TSpeedButton;
    Next_Sp: TSpeedButton;
    End_Sp: TSpeedButton;
    Bevel3: TBevel;
    New_Sp: TSpeedButton;
    Save_Sp: TSpeedButton;
    Open_Sp: TSpeedButton;
    Crop_Sp: TSpeedButton;
    Brush_Sp: TSpeedButton;
    Curve_Sp: TSpeedButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Tag_Sp: TSpeedButton;
    Preview_Sp: TSpeedButton;
    Picture_Sp: TSpeedButton;
    Menu_Sp: TSpeedButton;
    PopupMenu1: TPopupMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    SaveAsPicture1: TMenuItem;
    curve1: TMenuItem;
    Brush1: TMenuItem;
    CropPicture1: TMenuItem;
    TagEditor1: TMenuItem;
    Font1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    First1: TMenuItem;
    Next1: TMenuItem;
    Pervious1: TMenuItem;
    End1: TMenuItem;
    N4: TMenuItem;
    Help1: TMenuItem;
    VideoHelp1: TMenuItem;
    About1: TMenuItem;
    Back_Img: TStretchImage;
    SaveDialog1: TSaveDialog;
    PictureConverter1: TPictureConverter;
    Down_LB: TLabel;
    Bevel8: TBevel;
    DownPos_Lb: TLabel;
    OpenDialog1: TOpenPictureDialog;
    PaintBox: TPaintBox;
    ImageVisible1: TMenuItem;
    Undo1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Clear1: TMenuItem;
    Delete1: TMenuItem;
    WordsCount_LB: TLabel;
    CurrentWord_LB: TLabel;
    NewWord_Sp: TSpeedButton;
    Del_SP: TSpeedButton;
    Clear_Sp: TSpeedButton;
    AddNewWord1: TMenuItem;
    HotPoint_Sh: TShape;
    ImageVisible2: TMenuItem;
    HotPoints1: TMenuItem;
    HotPointsActive: TMenuItem;
    HotPointsVisible: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    CloseAll1: TMenuItem;
    LastLine1: TMenuItem;
    LastFillBrush1: TMenuItem;
    Titel_UnActive_Img: TImage;
    ApplicationEvents1: TApplicationEvents;
    Topic_LB: TLabel;
    Bevel7: TBevel;
    Bevel9: TBevel;
    Label1: TLabel;
    Kind_LB: TLabel;
    Bevel10: TBevel;
    Current_Word_Ed: TEdit;
    Kind_Ed: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Menu_SpClick(Sender: TObject);
    procedure Open_SpClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Menu_SpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Back_ImgRestretch(Sender: TObject);
    procedure New_SpClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewWord_SpClick(Sender: TObject);
    procedure Del_SPClick(Sender: TObject);
    procedure Clear_SpClick(Sender: TObject);
    procedure First_SpClick(Sender: TObject);
    procedure Per_SpClick(Sender: TObject);
    procedure Next_SpClick(Sender: TObject);
    procedure End_SpClick(Sender: TObject);
    procedure Tag_SpClick(Sender: TObject);
    procedure Save_SpClick(Sender: TObject);
    procedure Picture_SpClick(Sender: TObject);
    procedure Preview_SpClick(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HotPoint_ShMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageVisible2Click(Sender: TObject);
    procedure HotPointsVisibleClick(Sender: TObject);
    procedure HotPointsActiveClick(Sender: TObject);
    procedure CloseAll1Click(Sender: TObject);
    procedure LastLine1Click(Sender: TObject);
    procedure LastFillBrush1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure About1Click(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrentWord_LBMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure CurrentWord_LBClick(Sender: TObject);
    procedure Kind_LBClick(Sender: TObject);
    procedure Current_Word_EdKeyPress(Sender: TObject; var Key: Char);
    procedure Kind_EdKeyPress(Sender: TObject; var Key: Char);
    procedure curve1Click(Sender: TObject);
    procedure Brush1Click(Sender: TObject);
  private
    Procedure CreateNewHotPoint(x,Y:Integer);
    Procedure DestroyHotPoints;
    Procedure CreateHotPoints(Arr:FinallArray;CurrentWord:Integer);
    Procedure UpDateDesign_W_H;
  public
    CurrentDir : String;
    FontArr : FinallArray;
    current   //Current Of New Word
    ,CurrentShow //Current Of Showing Word;
    ,PolyCurrent //Curent Of PolyBezeir
                 : Integer;
    State : Byte;
    procedure WmNcHitTest (var Msg: TWmNcHitTest);
      message wm_NcHitTest;
    procedure CreateParams(var Params: TCreateParams); override;

  end;

var
  MainForm: TMainForm;
  Parameter :Boolean =False; //This Var Difine If Project Execute By Prameters Or Not

implementation

{$R *.DFM}
uses DirUnit, TagEditor_Un, Preview_UN, About_Un;

{@@@@@@@@@@@@@@@@@  PART 1 @@@@@@@@@@@@@@@@@@@@@@@@}
{ThisPart Is Just For Moving The Form}
procedure TMainForm.WmNcHitTest(var Msg: TWmNcHitTest);
var
  Pt: TPoint;
begin
  Pt := Point (Msg.XPos, Msg.YPos);
  Pt := ScreenToClient (Pt);
  if PtInRect (Rect( Titel_UnActive_Img.Left,Titel_UnActive_Img.Top,Titel_UnActive_Img.Width+Titel_UnActive_Img.Left,Titel_UnActive_Img.Height+Titel_UnActive_Img.Top), pt) then
    Msg.Result := htCaption
  else
    inherited;
end;

procedure TMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_THICKFRAME or WS_POPUP or WS_BORDER;
end;
{@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@}


procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
  If MainForm.WindowState <> wsMaximized Then MainForm.WindowState := wsMaximized
   Else
  MainForm.WindowState := wsNormal;
end;

procedure TMainForm.BitBtn3Click(Sender: TObject);
begin
 Application.Minimize;
end;

procedure TMainForm.Menu_SpClick(Sender: TObject);
begin
 PopUpMenu1.Popup(MainForm.Left +Panel1.Left + Menu_Sp.Left + Menu_sp.Width , Mainform.Top +Panel1.Top + Menu_Sp.Top);

end;


//                           Start From Here
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

procedure TMainForm.HotPoint_ShMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
// This Part Occured When You Click A Hot Point
// Every HotPoint Has Its Name That Like 'S123' . This Name Has Meaning.
// 'S' Is Start Of The Name '1' Is Number Of Points In FontArr[].PolyBezieArr[][Here] That
// Can Accept Tow Value '1' & '4'.The Other Number '23' Is Discribe The PolyCurrent And
// You Should Use It As Below:  FontArr[].PolyBezieArr[Here][] .It Gives You The Top And
// Left Of Then Point To Conect This Tow to Gether.
  If Curve_Sp.down Then
   IF MessageDlg('Link To This Point...?',mtConfirmation,[MbYes,MbNo],0) = MrYes Then
    With Sender as TShape Do PaintBox.OnMouseDown(Self,mbLeft,[ssLeft],
                                                  FontArr[CurrentShow].polyBezieArr[ StrToInt(Copy(Name, 3, Length(Name)))] [StrToInt(Copy(Name, 2, 1))].x
                                                  , FontArr[CurrentShow].polyBezieArr[ StrToInt(Copy(Name, 3, Length(Name)))] [StrToInt(Copy(Name, 2, 1))].Y)
   Else
    With Sender as TShape Do PaintBox.OnMouseDown(Self,mbLeft,[ssLeft],Left+X -PaintBox.Left, Top+Y -PaintBox.Top);
 
end;


Procedure TMainForm.CreateNewHotPoint(x,Y:Integer);
 Var S:Tshape;
 Begin
 {This Part Just Create a New HotPoint When You Call It.}

   S:= TShape.create(MainForm);  //Create AHotPoint
   Case State Of
    1: S.Name:= 'S'+ Format('%d%d',[1,PolyCurrent]);
    3: S.Name:= 'S'+ Format('%d%d',[4,PolyCurrent]);
   End;
   s.Width := HotPoint_Sh.Width;
   s.Height := HotPoint_Sh.Height;
   S.Shape := StCircle;
   s.Cursor := CrHandPoint;
   S.Brush.Style := BsClear;
   S.Top := PaintBox.Top + Y-2;
   S.Left := PaintBox.Left + X-2;
   s.Hint := 'Hot Point';
   S.ShowHint := True;
   S.OnMouseDown := HotPoint_Sh.OnMouseDown;
   If HotPointsVisible.Checked Then
    S.Pen.Style:= PsSolid
   Else
    S.Pen.Style:= PsClear;
   S.Parent := Panel2;
   S.BringToFront;
 End;

Procedure TMainForm.CreateHotPoints(Arr :FinallArray;CurrentWord:Integer);
 Var I,X1,Y1:Integer;
 Begin
 {This Part Just Create HotPoints When You Call It.
  It Means When You call This Procedure It Look For Points
  In FontArr And Then Create HotPoints In Their Places.}
  For I:=0 To Length(Arr[CurrentWord].PolyBezieArr)-1 Do
  Begin
    X1 := (Arr[CurrentWord].PolyBezieArr[I][1].x *PaintBox.Width ) Div FontArr[CurrentShow].DesignWidth;
    Y1 := (Arr[CurrentWord].PolyBezieArr[I][1].Y *PaintBox.Height ) Div FontArr[CurrentShow].DesignHeight;
    IF HotPointsActive.Checked Then CreateNewHotPoint(X1,Y1);
    X1 := (Arr[CurrentWord].PolyBezieArr[I][4].x *PaintBox.Width ) Div FontArr[CurrentShow].DesignWidth;
    Y1 := (Arr[CurrentWord].PolyBezieArr[I][4].Y *PaintBox.Height ) Div FontArr[CurrentShow].DesignHeight;
    IF HotPointsActive.Checked Then CreateNewHotPoint(X1,Y1);
  End;
 End;


Procedure TMainForm.DestroyHotPoints;
 Var J:Integer;D:Boolean;
 Begin
  { This Procedure Occures When You Need Refreshing The Hot Points "For
    Example When Resizing Form" You Can Destroye Them All And Then Create
    New Points In Their Places.
    This Part Looking For All TShapes That Are In The Form If It Finds Any
    It DestroyIt.Becuse HotPoints Are Tshape.}
  D:= True;
  J := 0;
  While D Do
  Begin
   If (Components[J] Is TShape) And (Components[J].Name <> 'HotPoint_Sh') Then
    Begin
      components[J].Destroy;
      J:= 0;
    End//If
   Else
    Inc(J);//Else
   If J = ComponentCount Then D := False;
  End; //While
 End;

Procedure TMainForm.UpDateDesign_W_H;
Var I,J:Integer;
 Begin
 //This Part For Resizing All Points WithCurrent Seting At designTime
 For I:= 0 to Length(FontArr[CurrentShow].PolyBezieArr)-1 Do
  For J:= 1 To 4 Do
  Begin
    FontArr[CurrentShow].PolyBezieArr[I][j].x := (FontArr[CurrentShow].PolyBezieArr[I][J].x *PaintBox.Width ) Div FontArr[CurrentShow].DesignWidth;
    FontArr[CurrentShow].PolyBezieArr[I][j].Y := (FontArr[CurrentShow].PolyBezieArr[I][J].Y *PaintBox.Height ) Div FontArr[CurrentShow].DesignHeight;
  End; //For

 For I:= 0 To Length(FontArr[CurrentShow].FillArr)-1 Do
 Begin
   FontArr[CurrentShow].FillArr[I].x :=  (FontArr[CurrentShow].FillArr[I].x * PaintBox.Width ) Div FontArr[CurrentShow].DesignWidth;
   FontArr[CurrentShow].FillArr[I].Y :=  (FontArr[CurrentShow].FillArr[I].Y * PaintBox.Height ) Div FontArr[CurrentShow].DesignHeight;   
 End; // I

 FontArr[CurrentShow].DesignWidth := PaintBox.Width;
 FontArr[CurrentShow].DesignHeight := PaintBox.Height;

 DestroyHotPoints;
 IF HotPointsActive.Checked Then CreateHotpoints(FontArr,CurrentShow);
End;


procedure TMainForm.Open_SpClick(Sender: TObject);
begin
 {In This Part If Program ExeCute With Parameters The OpenDialog Will Not Be Execute
 But The FileName Will Be The Parameter.}
 If Not Parameter Then
 Begin
   If Not OpenDialog1.Execute Then Exit;
 End  
 Else
   OpenDialog1.FileName:= ParamStr(1);
 Parameter:= False;

 If (UpperCase(Pas(OpenDialog1.FileNAme)) = 'GF') Then
 Begin
   DestroyHotPoints;
   FontArr := ReadFromFile(OpenDialog1.FileName);
   Current := 0;
   currentShow :=0;
   State := 0;
   DrawArray(PaintBox.Canvas,Current,FontArr,PaintBox.Width,PaintBox.Height);
   IF HotPointsActive.Checked Then CreateHotPoints(FontArr,0);
   PolyCurrent:= Length(FontArr[0].PolyBezieArr)-1;
   WordsCount_Lb.Caption := IntToStr(Length(FontArr));
   Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
   CurrentWord_Lb.Caption := '1';
   Current := Length(FontArr)-1;
   If Length(FontArr) > 1 Then
   Begin
     Next_Sp.Enabled :=True;
     End_Sp.Enabled := True;
   End;
   Save_Sp.Enabled := True;
   Picture_Sp.Enabled :=True;
   Brush_Sp.Enabled :=True;
   Curve_Sp.Enabled :=True;
   Tag_Sp.Enabled :=True;
   Preview_SP.Enabled :=True;
   First_Sp.Enabled := False;
   Per_Sp.Enabled := False;
   Clear_Sp.Enabled := True;
   NewWord_Sp.Enabled := True;
   PaintBox.Repaint;
   TagForm.Name_Edit.Text := GiveComment(V_Name);
   TagForm.Ver_Edit.Text := GiveComment(V_Version);
   TagForm.Copy_Edit.Text := GiveComment(V_copyRight);
   TagForm.Created_Edit.Text := GiveComment(V_Created_By);
   TagForm.Com_Edit.Text := GiveComment(V_Compony);
   TagForm.Other_Edit.Text := GiveComment(V_Others);
   TagForm.Comment_Memo.Clear;
   TagForm.Comment_Memo.Lines.add( GiveComment(V_comment) );
   UpDateDesign_W_H;
   Exit;
 End; //If(Upper...

 If (UpperCase(Pas(OpenDialog1.FileNAme)) = 'WMF') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'EMF') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'JPG') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'JPEG') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'GIF')  Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'BMP')  Then
 Begin
   DestroyHotPoints;
   Back_Img.Picture.LoadFromFile(OpenDialog1.FileName);
   Back_Img.ReStretch;
   Crop_Sp.Enabled := true;
   IF HotPointsActive.Checked Then CreateHotPoints(FontArr,0);
   UpDateDesign_W_H;
   Exit;
 End;//IF Upper...

 If (UpperCase(Pas(OpenDialog1.FileNAme)) = 'PCX') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'TIF') Or
    (UpperCase(Pas(OpenDialog1.FileNAme)) = 'PNG') Then
 Begin
   PictureConverter1.Save(OpenDialog1.FileName,'C:\Temp.bmp',Format_BMP);
   Back_Img.Load('C:\Temp.bmp');
   Try
     DeleteFile('C:\temp.bmp');
   Except
   End;
   DestroyHotPoints;
   IF HotPointsActive.Checked Then CreateHotPoints(FontArr,0);
   UpDateDesign_W_H;
 End;
 MessageDlg('Can Not Open File.!',mtError,[mbOk],0);

end;





procedure TMainForm.FormResize(Sender: TObject);
begin
 If (Back_Img.Picture.Graphic <> nil) And (Back_Img.Visible) Then Back_Img.ReStretch
 Else
  Begin
    PaintBox.Align:= alClient;
    PaintBox.Align:= alNone;
  End;
 UpDateDesign_W_H;//For Resizing Points
end;



procedure TMainForm.Menu_SpMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 With Sender As TSpeedButton Do //This Part For Updating Down_LB Caption
  Down_Lb.Caption := Hint;
end;



procedure TMainForm.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Down_Lb.Caption := 'Graphic Font Maker ';
end;



procedure TMainForm.Back_ImgRestretch(Sender: TObject);
begin
 PaintBox.SetBounds(Back_Img.Left,Back_img.Top,Back_Img.Width,Back_Img.Height);
end;

procedure TMainForm.New_SpClick(Sender: TObject);
begin

 If MessageDlg('Do You Want To Work On a New Project !?',mtConfirmation,[MbYes,MbNo],0) = mrYes Then
 Begin
  DestroyHotPoints;
  Current := 0;
  currentShow := 0;
  SetLength(FontArr,1);
  SetLength(Fontarr[0].PolyBezieArr,0);
  SetLength(FontArr[0].FillArr,0);
  FontArr[0].DesignWidth := PaintBox.Width;
  FontArr[0].DesignHeight := PaintBox.Height;
  PaintBox.Repaint;
  MainForm.OnResize(Self);
  Save_Sp.Enabled := True;
  Picture_Sp.Enabled :=True;
  Brush_Sp.Enabled :=True;
  Curve_Sp.Enabled :=True;
  Tag_Sp.Enabled :=True;
  Preview_SP.Enabled :=True;
  WordsCount_LB.Caption := '1';
  CurrentWord_Lb.Caption := '1';
  Kind_Lb.Caption:= IntToStr(FontArr[CurrentShow].Kind);  
  NewWord_Sp.Enabled := True;
  Clear_Sp.Enabled:=True;
  Clear_Sp.Click;
  First_sp.Enabled:= False;
  Per_Sp.Enabled:= False;
  Next_Sp.Enabled:= False;
  End_Sp.Enabled:= False;
  PolyCurrent:= -1;
  UpDateDesign_W_H;
 End; //Message


end;

procedure TMainForm.PaintBoxPaint(Sender: TObject);
begin
 If State = 0 Then PaintBox.Canvas.Pen.Mode := pmCopy;
 If (Length(FontArr) <> 0) And (Length(FontArr[Currentshow].polyBezieArr) <> 0) Then
   DrawArray(PaintBox.Canvas,CurrentShow,FontArr,PaintBox.Width,PaintBox.Height);
 If State = 0 Then PaintBox.Canvas.Pen.Mode := pmNot;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Current := 0;
  PolyCurrent := -1;
  SetLength(FontArr,1);
  SetLength(Fontarr[0].PolyBezieArr,0);
  SetLength(FontArr[0].FillArr,0);
  FontArr[0].DesignWidth := 0;
  FontArr[0].DesignHeight := 0;
  State := 0;
  PaintBox.Repaint;
  Animate1.FileName:= GetCurrentDir + '\1.avi';
  Animate1.Active:= True;
end;

procedure TMainForm.NewWord_SpClick(Sender: TObject);
begin
 If Not NewWord_Sp.Enabled Then Exit;
 DestroyHotPoints;
 Inc(Current);
 SetLength(FontArr,Length(FontArr)+1);
 SetLength(Fontarr[Current].PolyBezieArr,0);
 SetLength(FontArr[current].FillArr,0);
 FontArr[Current].DesignWidth := PaintBox.Width;
 FontArr[Current].DesignHeight := PaintBox.Height;
 PolyCurrent := -1; //Because When You Click It Would Be Increase 1
 State := 0;
 Kind_Lb.Caption:= '0';
 Per_Sp.Enabled:= True;
 First_Sp.Enabled:= True;
 Del_SP.Enabled:= True;
 Next_Sp.Enabled:= False;
 End_SP.Enabled:= False;
 CurrentShow:= Current;
 WordsCount_Lb.Caption:= IntToStr(Current + 1);
 CurrentWord_Lb.Caption:= IntToStr(Current + 1);
 PaintBox.Repaint;
 Clear_Sp.Click;
end;

procedure TMainForm.Del_SPClick(Sender: TObject);
begin
 If Not Del_Sp.Enabled Then Exit;
 DestroyHotPoints;
 If CurrentShow = Current Then Dec(CurrentShow);
 Dec(Current);
 CurrentWord_Lb.Caption := IntToStr(Current+ 1); //Becuase when Current Is 0 Then Caption Should Be 1
 WordsCount_Lb.Caption := IntToStr(Current + 1);
 UpDateDesign_W_H;
 If Current = 0 Then
 Begin
   Del_Sp.Enabled := False;
   Per_Sp.Enabled := False;
   First_Sp.Enabled := False;
   Del_SP.Enabled := False;
 End;//If

 Next_Sp.Enabled := False;
 End_SP.Enabled := False;
 SetLength(FontArr,Length(FontArr)-1);
 Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
 PaintBox.Repaint;
end;

procedure TMainForm.Clear_SpClick(Sender: TObject);
begin
 If Not clear_Sp.Enabled Then Exit;
 DestroyHotPoints;
 SetLength(Fontarr[CurrentShow].PolyBezieArr,0);
 SetLength(FontArr[currentShow].FillArr,0);
 FontArr[CurrentShow].DesignWidth := PaintBox.Width;
 FontArr[CurrentShow].DesignHeight := PaintBox.Height;
 State := 0;
 PolyCurrent := -1;
 PaintBox.Repaint;
end;

procedure TMainForm.First_SpClick(Sender: TObject);
begin
 If Not first_Sp.Enabled Then Exit;
 CurrentShow := 0 ;
 CurrentWord_LB.Caption := IntToStr(CurrentShow +1);
 PolyCurrent:= Length(FontArr[CurrentShow].PolyBezieArr)-1;
 UpDateDesign_W_H;
 Next_Sp.Enabled := True;
 End_Sp.Enabled := True;
 First_Sp.Enabled := False;
 Per_Sp.Enabled := False;
 Del_Sp.Enabled := False;
 CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
 Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
 PaintBox.Repaint;
end;


procedure TMainForm.Per_SpClick(Sender: TObject);
begin
 If Not Per_Sp.Enabled Then Exit;
 Dec(CurrentShow);
 CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
 Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
 PolyCurrent:= Length(FontArr[CurrentShow].PolyBezieArr)-1;
 UpDateDesign_W_H;
 Next_Sp.Enabled := True;
 End_Sp.Enabled := True;
 If CurrentShow = 0 Then
  Begin
   First_Sp.Enabled := False;
   Per_Sp.Enabled := False;
  End;
 Del_Sp.Enabled := False;
 CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
 PaintBox.Repaint;
end;

procedure TMainForm.Next_SpClick(Sender: TObject);
begin
 If Not Next_Sp.Enabled Then Exit;
 Inc(CurrentShow);
 CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
 Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
 PolyCurrent:= Length(FontArr[CurrentShow].PolyBezieArr)-1;
 UpDateDesign_W_H;
 First_Sp.Enabled := True;
 Per_Sp.Enabled := True;
 If CurrentShow = Current Then
 Begin
   Next_Sp.Enabled :=False;
   End_Sp.Enabled := False;
   Del_Sp.Enabled := True;
 End;//If
 PaintBox.Repaint;
end;

procedure TMainForm.End_SpClick(Sender: TObject);
begin
 If Not End_Sp.Enabled Then Exit;
 CurrentShow := Current;
 PolyCurrent:= Length(FontArr[CurrentShow].PolyBezieArr)-1;
 UpDateDesign_W_H;
 Next_Sp.Enabled := False;
 End_Sp.Enabled := False;
 Del_Sp.Enabled := True;
 First_Sp.Enabled := True;
 Per_Sp.Enabled := True;
 CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
 Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
 PaintBox.Repaint;
end;

procedure TMainForm.Tag_SpClick(Sender: TObject);
begin
 TagForm.ShowModal;
end;

procedure TMainForm.Save_SpClick(Sender: TObject);
 Var S:String;
begin
 If (Sender Is TmenuItem) And ((Sender As TMenuItem).Name ='SaveAs1') Then
  SaveDialog1.FileNAme := '';
 
 SaveDialog1.Filter := 'Graphic Font (*.GF)|*.Gf';
 If SaveDialog1.FileNAme = '' Then If Not (SaveDialog1.Execute) Then Exit;
 If (Length(FontArr) > 0) Then
 Begin
   S := '';
   With TagForm Do
   Begin
     S := S + Name_edit.Text + #13;
     S := S + Ver_edit.Text + #13;
     S := S + Copy_edit.Text + #13;
     S := S + Created_edit.Text + #13;
     S := S + Com_edit.Text + #13;
     S := S + Other_edit.Text + #13;
     S := S + Comment_Memo.Lines.Text + #13;
     WriteToFile(SaveDialog1.FileName,S,FontArr);
   End;
 End;

end;

procedure TMainForm.Picture_SpClick(Sender: TObject);
Var Bmp:Tbitmap;I:Integer; D:Boolean;
begin
 SaveDialog1.Filter := 'BitMap Image (*.Bmp)|*.bmp';
 If SaveDialog1.Execute Then
 Begin
   Bmp := TbitMap.Create;
   bmp.Width := PaintBox.Width ;
   Bmp.Height := PaintBox.Height ;
   DrawArray(Bmp.canvas,CurrentShow,FontArr,bmp.Width,Bmp.Height);
   d:= True; //This Var Is Just For Help
   // InThe Whole This Part For Cheacking To See If SaveDialog.FileName Has Any Extention.

   For I:= 0 To Length(SaveDialog1.FileName) Do
     IF SaveDialog1.FileName[I] = '.' Then D:=False;

   If D Then SaveDialog1.FileName := SaveDialog1.FileNAme + '.Bmp';
   bmp.SaveToFile(SaveDialog1.FileName);

   Bmp.Free;
 End;
end;

procedure TMainForm.Preview_SpClick(Sender: TObject);
begin
  Per_Form.showModal;
end;

Var Painted:boolean;
procedure TMainForm.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  Var Help :Boolean;
begin

 If Sender Is TPaintBox Then DownPos_lb.Caption := 'Position : X = '+IntToStr(X) + ' ,Y = ' +IntToStr(Y)
   Else
 If Back_img.Picture.Graphic <> nil Then DownPos_lb.Caption := 'Position : X = '+IntToStr(X) + ' ,Y = ' +IntToStr(Y);
 Help:=False;

 IF Curve_Sp.Down Then
 Begin
   If Help Then PaintBox.Cursor := crHandPoint
   Else If PaintBox.Cursor <> crDefault Then PaintBox.Cursor :=crDefault;

   If State =5 Then State :=0;
   If (State <= 1) Or (State =5) Then Exit;
   PaintBox.Canvas.PolyBezier(FontArr[Currentshow].PolyBezieArr[PolyCurrent]);
   If (State = 3) Then
    Begin
     FontArr[CurrentShow].PolyBezieArr[PolyCurrent][2].x := X;
     FontArr[CurrentShow].PolyBezieArr[PolyCurrent][2].y := Y;
    End;
   FontArr[CurrentShow].PolyBezieArr[PolyCurrent][State].x := X;
   FontArr[CurrentShow].PolyBezieArr[PolyCurrent][State].y := Y;
   PaintBox.Canvas.pen.Mode := pmNot;
   PaintBox.Canvas.PolyBezier(FontArr[CurrentShow].PolyBezieArr[PolyCurrent]);
 End;//Curve_Sp.Down
{ If (State >= 2) And (Not Painted) Then
 Begin
   PaintBox.Repaint;
   Painted:=True;
 End;  }
 If State =1 Then Painted:= False;
end;

procedure TMainForm.PaintBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  Var I:Integer;
begin

 If (Button = mbLeft) And (Curve_Sp.Down) Then
 Begin
   If State = 2 Then
     State := 5;

   If State = 3 Then
   Begin
     fontArr[CurrentShow].PolyBezieArr[PolyCurrent][3].x := X;
     fontArr[CurrentShow].PolyBezieArr[PolyCurrent][3].Y := y;
     Dec(State); //State = 2
   End;//State =2;

   IF State = 1 Then
   Begin
     For I:= 2 To 4 Do
      FontArr[CurrentShow].PolyBezieArr[PolyCurrent][I].x :=  X;
     For I:= 2 To 4 Do
      FontArr[CurrentShow].PolyBezieArr[PolyCurrent][I].Y :=  Y;
     Inc(State,2); //State Would Be 3 For Third Point
     IF HotPointsActive.Checked Then CreateNewHotPoint(X,Y);
     PaintBox.Canvas.pen.Mode := pmnop;     
   End;//State =1

   IF State = 0 Then
   Begin
    Inc(PolyCurrent);
    SetLength(FontArr[CurrentShow].PolyBezieArr,
              Length(FontArr[CurrentShow].PolyBezieArr) + 1);
    Inc(State);
    FontArr[CurrentShow].PolyBezieArr[PolyCurrent][1].x := X;
    FontArr[CurrentShow].PolyBezieArr[PolyCurrent][1].Y := Y;
    IF HotPointsActive.Checked Then CreateNewHotPoint(X,Y);
    For I:= 2 To 4 Do
     FontArr[CurrentShow].PolyBezieArr[PolyCurrent][I].x :=  X;
    For I:= 2 To 4 Do
      FontArr[CurrentShow].PolyBezieArr[PolyCurrent][I].Y :=  Y;
   End;//State =0;
 End;// MbLeft Down And Curve_Sp

If (Button = mbLeft) And (Brush_Sp.Down) Then
 Begin
  If State <> 0 Then
  Begin
   ShowMessage('You Should Compelete Your Drawing First');
   Exit;
  End;//State <>0

  PaintBox.RePaint;
  SetLength(FontArr[CurrentShow].FillArr,Length(FontArr[CurrentShow].FillArr)+1);
  FontArr[CurrentShow].FillArr[(Length(FontArr[CurrentShow].FillArr))-1]:= Point(x,Y);
  PaintBox.Canvas.FloodFill(X,Y,PaintBox.Canvas.Pixels[x,y],fsSurface);
 End;// MbLeft Down And Brush_Sp


end;


procedure TMainForm.ImageVisible2Click(Sender: TObject);
begin
 ImageVisible2.Checked := Not ImageVisible2.Checked;
 If Not ImageVisible2.Checked Then Back_Img.Visible :=False
  Else  Back_Img.Visible :=True;
OnResize(Self)
end;

procedure TMainForm.HotPointsVisibleClick(Sender: TObject);
begin
 HotPointsVisible.Checked := Not HotPointsVisible.Checked;
 DestroyHotPoints;
 If HotPointsActive.Checked Then CreateHotPoints(FontArr,CurrentShow);
 PaintBox.Repaint;
end;

procedure TMainForm.HotPointsActiveClick(Sender: TObject);
begin
 HotPointsActive.Checked := Not HotPointsActive.Checked;
 DestroyHotPoints;
 If HotPointsActive.Checked Then CreateHotPoints(FontArr,CurrentShow);
 PaintBox.Repaint;
end;

procedure TMainForm.CloseAll1Click(Sender: TObject);
begin
  Current := 0;
  PolyCurrent := -1;
  SetLength(FontArr,1);
  SetLength(Fontarr[0].PolyBezieArr,0);
  SetLength(FontArr[0].FillArr,0);
  FontArr[0].DesignWidth := 0;
  FontArr[0].DesignHeight := 0;
  State := 0;
  PaintBox.Repaint;
  Save_Sp.Enabled := False;
  Picture_Sp.Enabled := False;
  Brush_Sp.Enabled := False;
  Curve_Sp.Enabled := False;
  Tag_Sp.Enabled := False;
  Preview_SP.Enabled := False;
  WordsCount_LB.Caption := '0';
  CurrentWord_Lb.Caption := '0';
  NewWord_Sp.Enabled := False;
  Clear_Sp.Enabled:= False;
  Per_Sp.Enabled := False;
  First_Sp.Enabled := False;
  Next_Sp.Enabled := False;
  End_Sp.Enabled := False;
  Del_Sp.Enabled :=False;
  DestroyHotPoints;
end;

procedure TMainForm.LastLine1Click(Sender: TObject);
begin
  If Length(FontArr[CurrentShow].PolyBezieArr) <> 0 Then
  Begin
    SetLength(FontArr[CurrentShow].PolyBezieArr,Length(FontArr[CurrentShow].PolyBezieArr)-1);
    Dec(PolyCurrent);
  End;
  DestroyHotPoints;
  PaintBox.Repaint;
  CreateHotPoints(FontArr,CurrentShow);
end;

procedure TMainForm.LastFillBrush1Click(Sender: TObject);
begin
  If Length(FontArr[CurrentShow].FillArr) <> 0 Then
     SetLength(FontArr[CurrentShow].FillArr,Length(FontArr[CurrentShow].FillArr)-1);
  DestroyHotPoints;
  PaintBox.Repaint;
  CreateHotPoints(FontArr,CurrentShow);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 Var R:Integer;
begin
 R := MessageDlg('Save Changes To '+ TagForm.Name_Edit.text +' ?',mtInformation,[mbYes,MbNo,MbCancel],0);
 If R = mrYes Then
 Begin
   Save_Sp.Click;
   SetLength(FontArr,0);
 End;
 If R = mrCancel Then
   Canclose := False

end;

procedure TMainForm.About1Click(Sender: TObject);
begin
 About_Fr.ShowModal;
end;

procedure TMainForm.ApplicationEvents1Activate(Sender: TObject);
begin
 Titel_Active_Img.BringToFront;
 Bevel1.BringToFront;
 Topic_Lb.BringToFront;
end;

procedure TMainForm.ApplicationEvents1Deactivate(Sender: TObject);
begin
 Titel_UnActive_Img.BringToFront;
 Bevel1.BringToFront;
 Topic_Lb.BringToFront; 
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  If ParamCount <> 0 Then
  Begin
    Parameter:= True;
    Open_Sp.Click;
    OnResize(Self);
  End;

end;

procedure TMainForm.CurrentWord_LBMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 Down_Lb.Caption:= (Sender as TLabel).Hint;
end;

procedure TMainForm.CurrentWord_LBClick(Sender: TObject);
begin
 If Kind_Ed.Visible Then Kind_Ed.Visible:= False;
 Current_Word_Ed.Text:= CurrentWord_Lb.Caption;
 Current_Word_Ed.Visible:= True;
 Current_Word_Ed.SetFocus;
end;

procedure TMainForm.Kind_LBClick(Sender: TObject);
begin
 If Current_Word_Ed.Visible Then Current_Word_Ed.Visible:= False;
 Kind_Ed.Text:= Kind_LB.Caption;
 Kind_Ed.Visible:= True;
 Kind_Ed.SetFocus;
end;

procedure TMainForm.Current_Word_EdKeyPress(Sender: TObject;
  var Key: Char);
begin
 Try
 If Key = chr(27) Then Current_Word_Ed.Visible:= False;

 If Key = chr(13) Then
 Begin
   If (Current_Word_Ed.Text = '')  Then
   Begin
    Current_Word_Ed.Visible:= False;
    Exit;
   End;
   CurrentWord_Lb.Caption:= Current_Word_Ed.Text;

   IF StrToInt(Current_Word_Ed.Text) >= Current + 1 Then
   Begin
     End_Sp.Click;
     Current_Word_Ed.Visible:= False;
     CurrentWord_Lb.Caption:= IntToStr(CurrentShow + 1);
     Exit;
   End
   Else
     CurrentShow:= StrToInt(Current_Word_Ed.Text) - 1;

   IF StrToInt(Current_Word_Ed.Text) <= 1 Then
   Begin
     First_Sp.Click;
     Current_Word_Ed.Visible:= False;
     CurrentWord_Lb.Caption:= IntToStr(CurrentShow + 1);
     Exit;
   End;

   PolyCurrent:= Length(FontArr[CurrentShow].PolyBezieArr)-1;
   UpDateDesign_W_H;
   Next_Sp.Enabled := True;
   End_Sp.Enabled := True;
   First_Sp.Enabled := True;
   Per_Sp.Enabled := True;
   CurrentWord_LB.Caption := IntToStr(CurrentShow + 1);
   Kind_Lb.Caption:=IntToStr(FontArr[CurrentShow].Kind);
   PaintBox.Repaint;
   Current_Word_Ed.Visible:= False;
 End;
 Except
  First_Sp.Click;
  Current_Word_Ed.Visible:= False;
 End;
end;


procedure TMainForm.Kind_EdKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = chr(27) Then Kind_Ed.Visible:= False;

If Key = chr(13) Then
Begin
 IF WordsCount_Lb.Caption = '0' Then
 Begin
   Kind_Ed.Visible:= False;
   Exit;
 End;
 If (strToInt(Kind_Ed.Text) > 255) Or (strToInt(Kind_Ed.Text) < 0) Then Exit;
 Try
  FontArr[CurrentShow].Kind:= strToInt(Kind_Ed.Text);
  Kind_Lb.Caption:= Kind_Ed.Text;
 Except
  Kind_Lb.Caption:= '0';
 End;
 Kind_ed.Visible:= False;
End;
end;

procedure TMainForm.curve1Click(Sender: TObject);
begin
 Curve_sp.Down:= Not Curve_sp.Down;
 If Curve_sp.Down Then Curve_sp.Click;
end;

procedure TMainForm.Brush1Click(Sender: TObject);
begin
 Brush_sp.Down:= Not Brush_sp.Down;
 If Brush_sp.Down Then Brush_sp.Click;
end;

end.
