unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls,
   RichEdit, Vcl.ComCtrls, vcl.Printers,
   MidasLib, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    OpenTextFileDialog1: TOpenTextFileDialog;
    RichEdit1: TRichEdit;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    ColorDialog1: TColorDialog;
    ImageList1: TImageList;
    FontDialog1: TFontDialog;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    Colar1: TMenuItem;
    Recortar1: TMenuItem;
    Cordapagina1: TMenuItem;
    Cordafonte1: TMenuItem;
    SpeedButton16: TSpeedButton;
    SpeedButton12: TSpeedButton;
    procedure Button5Click(Sender: TObject);
    Procedure FindReplace (const Enc, subs: String; Var Texto: TRichedit);
    procedure acAbrirExecute(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Colar1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure Cordapagina1Click(Sender: TObject);
    procedure Cordafonte1Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PrintStrings(Strings: TStrings);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.acAbrirExecute(Sender: TObject);
begin
  showmessage('Teste');
end;

procedure TFormPrincipal.Button5Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := taCenter;
end;

procedure TFormPrincipal.Colar1Click(Sender: TObject);
begin
  RichEdit1.PasteFromClipboard;
end;

procedure TFormPrincipal.Copiar1Click(Sender: TObject);
begin
  RichEdit1.CopyToClipboard;
end;

procedure TFormPrincipal.Cordafonte1Click(Sender: TObject);
begin

  if ColorDialog1.Execute then
    RichEdit1.SelAttributes.Color := ColorDialog1.Color;

end;

procedure TFormPrincipal.Cordapagina1Click(Sender: TObject);
begin

  if ColorDialog1.Execute then
    RichEdit1.Color := ColorDialog1.Color;

end;

procedure TFormPrincipal.FindReplace(const Enc, subs: String; var Texto: TRichedit);
Var
  i, Posicao: Integer;
  Linha: string;
Begin

  For i:= 0 to Texto.Lines.count - 1 do
  begin

    Linha := Texto. Lines[i];
    Repeat
    Posicao:=Pos(Enc,Linha);
    If Posicao > 0 then
    Begin
    Delete(Linha,Posicao,Length(Enc));
    Insert(Subs,Linha,Posicao);
    Texto.Lines[i]:=Linha;
    end;
    until Posicao = 0;

  end;

End;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  RichEdit1.SelAttributes.Size := 12;
end;

procedure TFormPrincipal.Image9Click(Sender: TObject);
begin

;


end;

procedure TFormPrincipal.PrintStrings(Strings: TStrings);
var
 Prn  : TextFile;
 I    : word;
begin
  AssignPrn(Prn);
  try
   Rewrite(Prn);
   try
     for I := 0 to Strings.Count - 1 do
       writeln(Prn, Strings.Strings[I]);
   finally
     CloseFile(Prn);
   end;
except
   on EInOutError do
     MessageDlg('Erro imprimindo texto.', mtError, [mbOk], 0);
end;
end;

procedure TFormPrincipal.Recortar1Click(Sender: TObject);
begin
  RichEdit1.CutToClipboard;
end;

procedure TFormPrincipal.SpeedButton10Click(Sender: TObject);
begin
  if not ( fsItalic in RichEdit1.SelAttributes.Style) then
    RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsItalic]
  else
    RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style - [fsItalic]
end;

procedure TFormPrincipal.SpeedButton11Click(Sender: TObject);
begin
  if not (fsUnderline in RichEdit1.SelAttributes.Style) then
    RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsUnderline]
  else
    RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style - [fsUnderline]
end;

procedure TFormPrincipal.SpeedButton12Click(Sender: TObject);
begin
  RichEdit1.Print('');
end;

procedure TFormPrincipal.SpeedButton13Click(Sender: TObject);
{Link do c�digo abaixo
  https://www.devmedia.com.br/pesquisando-e-destacando-texto-no-richedit/24260}
var
  iPosIni : integer;

begin
    //Carrega o RichEdit com as propriedades iniciais
    RichEdit1.SelStart  := 0;
    RichEdit1.SelLength := length(RichEdit1.Text);
//    RichEdit1.SelAttributes.color := clBlack;
//    RichEdit1.SelAttributes.style := [];
//    RichEdit1.SelAttributes.Size  := 8;

    //Encontra e atribui a posi��o inicial do texto no RichEdit1
    iPosIni := RichEdit1.FindText(Edit1.Text, 0, length(RichEdit1.Text), []);

    //Verifica se o texto foi encontrado
    if iPosIni >= 0 then
    begin
        RichEdit1.SelStart  := iPosIni;
        RichEdit1.SelLength := length(Edit1.Text);
        RichEdit1.SelAttributes.color := clRed;
        RichEdit1.SelAttributes.style := [fsBold];
//        RichEdit1.SelAttributes.Size  := RichEdit1.SelAttributes.Size + 16;
    end;
end;


procedure TFormPrincipal.SpeedButton14Click(Sender: TObject);
//var
//  i: Integer;
begin

//  i:= pos( edit1.text,RichEdit1.Text)-2;
//  RichEdit1.SelStart := i;
//  RichEdit1.SelLength := length(edit1.text);

  FindReplace(Edit1.Text, Edit2.Text, RichEdit1);

end;

procedure TFormPrincipal.SpeedButton15Click(Sender: TObject);
begin

  if PrintDialog1.Execute then
    PrintStrings(RichEdit1.Lines);

end;

procedure TFormPrincipal.SpeedButton16Click(Sender: TObject);
begin

{Falta c�dificar esta parte da aplica��o}

end;

procedure TFormPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute then
      RichEdit1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);

//  RichEdit1.Lines.Add('');
  RichEdit1.SelectAll;

  RichEdit1.Paragraph.FirstIndent := 10;
  RichEdit1.Paragraph.LeftIndent := 15;
  RichEdit1.Paragraph.RightIndent := 15;

  RichEdit1.SelStart := 0;

end;

procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
  RichEdit1.Clear;
end;

procedure TFormPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
   RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TFormPrincipal.SpeedButton4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
      RichEdit1.SelAttributes.Color := ColorDialog1.Color;
end;

procedure TFormPrincipal.SpeedButton5Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    RichEdit1.Font := FontDialog1.Font;
end;

procedure TFormPrincipal.SpeedButton6Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := taLeftJustify
end;

procedure TFormPrincipal.SpeedButton7Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := taCenter
end;

procedure TFormPrincipal.SpeedButton8Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := taRightJustify;
end;

procedure TFormPrincipal.SpeedButton9Click(Sender: TObject);
begin
  if not ( fsBold in RichEdit1.SelAttributes.Style) then
    RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsBold]
  else
   RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style - [fsBold]
end;

end.
