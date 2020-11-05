unit Graphic_Font;

// GRAPHIC FONT .

interface

Uses
 Windows,
 Dialogs,
 graphics;

Type
 Arr = Array [1..4] Of TPoint; //Every Arr Hold A PolyBlazier
 SubRec = Record
           Kind : Byte;
           PolyBezieArr : Array Of Arr; // This, Hold Numbers Of PolyBelzeir That Make The Word
           FillArr: Array Of TPoint; // This One Hold Points That Word Should Be Fill
           DesignWidth,       //Hold Design Page Width
           DesignHeight: Integer;  //Hold Design Page Height
          End;

 FinallArray = Array Of SubRec;  // This Array Hold Numbers of Word For Example : M,D,Z,X,...

Const
 V_Name = 0;
 V_Version = 1;
 V_CopyRight = 2;
 V_Created_By = 3;
 V_Compony = 4;
 V_Others = 5;
 V_Comment =6;



Procedure WriteToFile(FileName,Comments:String;Arr:FinallArray);
Function ReadFromFile(FileName:String):FinallArray;
Procedure DrawArray(Can:Tcanvas ;FontNumberInArr:Integer ;Arr:FinallArray;
                    currentWidth,CurrentHeight:Integer);
Function GiveComment(V:Word):String;

implementation

Var OutFile,InFile : File;
    Buffer : Array [0..1048575] Of Byte;
    Counter : Integer = 0;
    ReadArr : FinallArray;
    Name,Version,
    CopyRight,Create,
    Compony,
    Others,
    Comment:String;


{*********************************************************************}
Procedure WriteToFile(FileName,Comments:String;Arr:FinallArray);
 {With This Procedure The Your Font Array Will Save In The File.
  Comments Is A Value That Save In The File Like Below:
   Name
   Version
   CopyRight
   Created By
   Company
   Others
   Comment

   If Comments Is 'Name'+chr(13)
                + 'Version' +chr(13)
                + 'Compony' +chr(13)
                + 'CopyRight' +chr(13)
                + 'CreatedBy' +chr(13)
                + 'Compony' +chr(13)
                + 'Others' +chr(13)
                + 'Comment'

  For Writing Numbers In The File We Have To Write Them With Tow Character
   Which Take up Less Than For Example Writing '1025'.
    1025 Div 255 = 4
    1025 Mod 255 = 5
   Then We Write in File As below : 45 .The Biggest Number You Can Enter
   With This Alguritm IS 255*255.

 ------------------------------------------------------------}
Var I,J,K:Integer;

Begin

   AssignFile(OutFile,FileName);
   Rewrite(OutFile,1);
   Counter := 0;

     { This Loop Set The Comments At The First Of The Buffer (File)}
   Buffer[counter] := Ord('G'); //Graphic
   Inc(Counter);
   Buffer[Counter] := Ord('F'); //Font
   Inc(Counter);
   Buffer[Counter] := 0 ; //Font
   Inc(Counter);
   Buffer[Counter] := Length(Arr) Div 255 ;  //Record The Length Of Arr To Be Easy To Read
   Inc(Counter);
   Buffer[Counter] := Length(Arr) Mod 255 ;
   Inc(Counter);
   Buffer[Counter] := 13;


   For I:= 1 To Length(Comments)  Do
    Begin
      Inc(Counter);
      Buffer[counter] := Ord(Comments[I]);
    End;//For
   Inc(Counter);
   Buffer[Counter] := 255;

   For I := 0 To Length(Arr)-1 Do
   Begin

    Inc(counter);
    Buffer[Counter] := Arr[I].Kind;

    For J:= 0 To Length(arr[I].PolyBezieArr)-1 Do
    Begin
       For K := 1 To 4 Do // For Points  In PolyBezeir Array
       Begin
          Inc(Counter);
          Buffer[Counter] := (arr[I].PolyBezieArr[J][K].X) Div 255 ;
          Inc(Counter);
          Buffer[Counter] := (arr[I].PolyBezieArr[J][K].X) Mod 255 ;
          Inc(Counter);
          Buffer[Counter] := (arr[I].PolyBezieArr[J][K].Y) Div 255 ;
          Inc(Counter);
          Buffer[Counter] := (arr[I].PolyBezieArr[J][K].Y) Mod 255 ;
       End; //For K;
    End; //For J
    Inc(Counter);
    Buffer[Counter] := 255;

    For J := 0 To Length(Arr[I].FillArr)-1 Do // For Filling points That Now Save To Array.
    Begin
      Inc(Counter);
      Buffer[Counter] := (arr[I].FillArr[J].x) Div 255 ;
      Inc(Counter);
      Buffer[Counter] := (arr[I].FillArr[J].x) Mod 255 ;
      Inc(Counter);
      Buffer[Counter] := (arr[I].FillArr[J].Y) Div 255 ;
      Inc(Counter);
      Buffer[Counter] := (arr[I].FillArr[J].Y) Mod 255 ;
    End; //For J
    Inc(Counter);
    Buffer[Counter] := 255;

    Inc(Counter);
    Buffer[Counter] := arr[I].DesignWidth Div 255 ;
    Inc(Counter);
    Buffer[Counter] := arr[I].DesignWidth Mod 255 ;
    Inc(Counter);
    Buffer[Counter] := arr[I].DesignHeight Div 255 ;
    Inc(Counter);
    Buffer[Counter] := arr[I].DesignHeight Mod 255 ;
    Inc(Counter);
    Buffer[Counter] := 255;
  End;//For I

  BlockWrite(OutFile,Buffer,counter + 1)

 End;
{*********************************************************************}
Function ReadFromFile(FileName:String):FinallArray;
Var Count,I,
    J,K,ArrLen :Integer;
    CharFind: Boolean;


 Begin
  AssignFile(infile,FileName);   //Assign A File To Open
  Reset(Infile,1);
  CharFind := True;      //This Is Just For Help
  Counter := 0 ;      //Current Position In Buffer
  I := 0;

  //Reading Data
  BlockRead(Infile,Buffer,SizeOf(Buffer),Count);
  Inc(I,5);
  Name:= '';
  Version:= '';
  CopyRight:= '';
  Comment:= '';
  Compony:= '';
  Others:= '';
  create:= '';
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
//Reading Comments
  While CharFind Do  //This Loap For Finding Name
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     Name := Name + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding Version
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     Version := Version + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding copyRight
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     copyRight := copyRight + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding create
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     create := create + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding compony
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     compony := compony + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding Others
  Begin
    Inc(I);
    If Buffer[I] <> 13 Then
     Others := Others + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;
  CharFind:= True;

  While CharFind Do  //This Loap For Finding Others
  Begin
    Inc(I);
    If Buffer[I] <> 255 Then
     Comment := comment + Chr(Buffer[I])
    Else
     CharFind :=False;
  End;

{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
  inc(I);
  Counter := I;
  CharFind := False;
  ArrLen := (Buffer[3] * 255) + Buffer[4]; //3,4 Is The Places That Saved The Length Of Array
  SetLength(ReadArr,ArrLen);

  For I:= 0 To ArrLen-1 Do
  Begin
    J := 0;
    K := 1;

    ReadArr[I].Kind := Buffer[Counter];
    inc(Counter);

    SetLength(ReadArr[I].PolyBezieArr,1);
    While Buffer[Counter] <> 255 Do //Filling The PolyBelzieArr Points
    Begin
     ReadArr[I].PolyBezieArr[J][K].x := (Buffer[Counter] * 255) + Buffer[Counter+1];
     Inc(Counter,2);
     ReadArr[I].PolyBezieArr[J][K].Y := (Buffer[Counter] * 255) + Buffer[Counter+1];
     Inc(Counter,2);
     Inc(K);
     If (K > 4) And (Buffer[Counter] <> 255) Then
      Begin
       SetLength(Readarr[I].PolyBezieArr, Length(Readarr[I].PolyBezieArr)+ 1);
       Inc(J);
       K := 1;
      End;
    End;

    inc(Counter);
    J := 0 ;
    SetLength(ReadArr[I].FillArr,0);
    While Buffer[Counter] <> 255 Do   //Filling The FillArr Ponits
    Begin
     SetLength(ReadArr[I].FillArr,Length(ReadArr[I].FillArr)+1);
     ReadArr[I].FillArr[J].x := (Buffer[Counter] * 255) + Buffer[Counter+1];
     Inc(Counter,2);
     ReadArr[I].FillArr[J].Y := (Buffer[Counter] * 255) + Buffer[Counter+1];
     Inc(Counter,2);
     Inc(J);
    End;

    Inc(Counter);
    ReadArr[I].DesignWidth := (Buffer[Counter] * 255) + Buffer[Counter+1]; //Set The DesignWidth
    Inc(Counter,2);
    ReadArr[I].DesignHeight := (Buffer[Counter] * 255) + Buffer[Counter+1];
    Inc(Counter,2+1);  // 2 Is FOr Counter And 1 Is For The Last 255  character In This Part
    If Counter > Count Then Break;
  End; //For
 Result := ReadArr;
 End;
{*********************************************************************}
{Use This Procedure To Draw The Font In A Canvas.
 Can : Is Canvas Area You Must Assign To.
 FontInNumber : As You Know GF File Can Store Diffrent Word Just Like
                Font.When You Want To Draw You Must Tell This Procedure
                Which Of These You Want To Draw.
 Arr : The Array That Contains Fonts That You Might Read  With Previous
       Procedure.

 CurrentWidth,
 CurrentHeight : These Two Is The Height & Width Of You Canvas Area.
}
Procedure DrawArray(Can : Tcanvas ; FontNumberInArr :Integer; Arr:FinallArray;
                    currentWidth,CurrentHeight:Integer);
Var J,k,X,Y:Integer;
    NewArr : Array [1..4] OF TPoint;
 Begin
   For J:= 0 To Length(Arr[FontNumberInArr].PolyBezieArr)-1 Do
   Begin
     For K:= 1 To 4 Do
     Begin
       X:= Arr[FontNumberInArr].PolyBezieArr[J][K].x ;  //Reading From Array
       Y:= Arr[FontNumberInArr].PolyBezieArr[J][K].Y ;
       NewArr[K].X:= (currentWidth * X) Div Arr[FontNumberInArr].DesignWidth; //UpDate X With Current Setting
       NewArr[K].Y:= (currentHeight * Y) Div Arr[FontNumberInArr].DesignHeight;  //UpDate Y With Current Setting
     End;
     can.PolyBezier(NewArr);
   End; //For J

   For J:= 0 To Length(Arr[FontNumberInArr].FillArr)-1 Do
   Begin
     X:= Arr[FontNumberInArr].FillArr[J].x ;  //Reading From Array
     Y:= Arr[FontNumberInArr].FillArr[J].y ;
     If (X = 0) And (Y = 0) Then Break;
     X:= (currentWidth * X) Div Arr[FontNumberInArr].DesignWidth; //UpDate X With Current Setting
     Y:= (currentHeight * Y) Div Arr[FontNumberInArr].DesignHeight;  //UpDate Y With Current Setting
     Can.FloodFill(X,Y,can.Pixels[X,y],fsSurface); //Filling
   End;//For J
 End;
{**********************************************************************}

Function GiveComment(V:Word):String;
 Begin
  {Call This For Giving Comments}
  Case V Of
    V_Name : Result:= Name;
    V_Version : Result:= Version;
    V_CopyRight : Result:= CopyRight;
    V_Created_By : Result:= Create;
    V_Compony : Result:= Compony;
    V_Others : Result:= Others;
    V_Comment : Result:= Comment;
  End;//Case
 End;

{**********************************************************************}
end.
