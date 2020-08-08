unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls,
  System.UITypes,
  RichEdit, Vcl.ComCtrls, Vcl.Printers,
  MidasLib, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Menus, RxRichEd;

type
  TFormPrincipal = class(TForm)
    OpenTextFileDialog1: TOpenTextFileDialog;
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
    RxRichEdit1: TRxRichEdit;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PageSetupDialog1: TPageSetupDialog;
    Edit2: TEdit;
    procedure Button5Click(Sender: TObject);
    Procedure FindReplace(const Enc, subs: String; Var Texto: TRichedit);
    procedure acAbrirExecute(Sender: TObject);
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
    procedure SetRichEditMargins(const mLeft, mRight, mTop, mBottom: extended;
      const re: TRxRichedit);

  var
    FTexto: WideString;
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
  RxRichEdit1.Paragraph.Alignment := paCenter;
end;

procedure TFormPrincipal.Colar1Click(Sender: TObject);
begin
  RxRichEdit1.PasteFromClipboard;
end;

procedure TFormPrincipal.Copiar1Click(Sender: TObject);
begin
  RxRichEdit1.CopyToClipboard;
end;

procedure TFormPrincipal.Cordafonte1Click(Sender: TObject);
begin

  if ColorDialog1.Execute then
    RxRichEdit1.SelAttributes.Color := ColorDialog1.Color;

end;

procedure TFormPrincipal.Cordapagina1Click(Sender: TObject);
begin

  if ColorDialog1.Execute then
    RxRichEdit1.Color := ColorDialog1.Color;

end;

procedure TFormPrincipal.FindReplace(const Enc, subs: String;
  var Texto: TRichedit);
Var
  i, Posicao: Integer;
  Linha: string;
Begin

  For i := 0 to Texto.Lines.count - 1 do
  begin

    Linha := Texto.Lines[i];
    Repeat
      Posicao := Pos(Enc, Linha);
      If Posicao > 0 then
      Begin
        Delete(Linha, Posicao, Length(Enc));
        Insert(subs, Linha, Posicao);
        Texto.Lines[i] := Linha;
      end;
    until Posicao = 0;

  end;

End;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  RxRichEdit1.SelAttributes.Size := 12;
end;

procedure TFormPrincipal.PrintStrings(Strings: TStrings);
var
  Prn: TextFile;
  i: word;
begin
  AssignPrn(Prn);
  try
    Rewrite(Prn);
    try
      for i := 0 to Strings.count - 1 do
        writeln(Prn, Strings.Strings[i]);
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
  RxRichEdit1.CutToClipboard;
end;

procedure TFormPrincipal.SetRichEditMargins(const mLeft, mRight, mTop,
  mBottom: extended; const re: TRxRichedit);
var
   ppiX, ppiY : integer;
   spaceLeft, spaceTop : integer;
   r : TRect;
begin
   // pixels por polegadas
   ppiX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
   ppiY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);

   // n�o imprimir margens
   spaceLeft := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX);
   spaceTop := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY);

   //calcular as margens
   R.Left := Round(ppiX * mLeft) - spaceLeft;
   R.Right := Printer.PageWidth - Round(ppiX * mRight) - spaceLeft;
   R.Top := Round(ppiY * mTop) - spaceTop;
   R.Bottom := Printer.PageHeight - Round(ppiY * mBottom) - spaceTop;

   // setar as margens
   re.PageRect := r;
end;

procedure TFormPrincipal.SpeedButton10Click(Sender: TObject);
begin
  if not(fsItalic in RxRichEdit1.SelAttributes.Style) then
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style +
      [fsItalic]
  else
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style -
      [fsItalic]
end;

procedure TFormPrincipal.SpeedButton11Click(Sender: TObject);
begin
  if not(fsUnderline in RxRichEdit1.SelAttributes.Style) then
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style +
      [fsUnderline]
  else
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style -
      [fsUnderline]
end;

procedure TFormPrincipal.SpeedButton12Click(Sender: TObject);
begin
  RxRichEdit1.Print('');
end;

procedure TFormPrincipal.SpeedButton13Click(Sender: TObject);
{ Link do c�digo abaixo
  https://www.devmedia.com.br/pesquisando-e-destacando-texto-no-richedit/24260 }
var
  iPosIni: Integer;

begin
  // Carrega o RichEdit com as propriedades iniciais
  RxRichEdit1.SelStart := 0;
  RxRichEdit1.SelLength := Length(RxRichEdit1.Text);
  // RxRichEdit1.SelAttributes.color := clBlack;
  // RxRichEdit1.SelAttributes.style := [];
  // RxRichEdit1.SelAttributes.Size  := 8;

  // Encontra e atribui a posi��o inicial do texto no RxRichEdit1
  iPosIni := RxRichEdit1.FindText(Edit1.Text, 0, Length(RxRichEdit1.Text), []);

  // Verifica se o texto foi encontrado
  if iPosIni >= 0 then
  begin
    RxRichEdit1.SelStart := iPosIni;
    RxRichEdit1.SelLength := Length(Edit1.Text);
    RxRichEdit1.SelAttributes.Color := clRed;
    RxRichEdit1.SelAttributes.Style := [fsBold];
    // RxRichEdit1.SelAttributes.Size  := RxRichEdit1.SelAttributes.Size + 16;
  end;
end;

procedure TFormPrincipal.SpeedButton14Click(Sender: TObject);
// var
// i: Integer;
begin

  // i:= pos( edit1.text,RxRichEdit1.Text)-2;
  // RxRichEdit1.SelStart := i;
  // RxRichEdit1.SelLength := length(edit1.text);

  // FindReplace(Edit1.Text, Edit2.Text, RxRichEdit1);

  with RxRichEdit1 do
    ReplaceDialog(SelText, '');

end;

procedure TFormPrincipal.SpeedButton15Click(Sender: TObject);
var MEsq, MDir, MSup, MInf : real;
begin
   {Estilo = RETRATO
   Margem Esquerda = 25
   Margem Direita = 20
   Margem Superior = 20
   Margem Inferior = 20}

   if PageSetupDialog1.Execute then
      begin

         Printer.Orientation := poPortrait; // vertical

         MEsq := (PageSetupDialog1.MarginLeft / 2.54)/1000;
         MDir := (PageSetupDialog1.MarginRight/ 2.54)/1000;
         MSup := (PageSetupDialog1.MarginTop  / 2.54)/1000;
         MInf := (PageSetupDialog1.MarginBottom / 2.54)/1000;

         SetRichEditMargins(MEsq, MDir, MSup, MInf, RxRichEdit1);

         if PrintDialog1.Execute then
           RxRichEdit1.Print('Printing with margins');

      end;
end;

procedure TFormPrincipal.SpeedButton16Click(Sender: TObject);
begin

  { Falta c�dificar esta parte da aplica��o }

end;

procedure TFormPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute then
    RxRichEdit1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);

  // RxRichEdit1.Lines.Add('');
  RxRichEdit1.SelectAll;

  RxRichEdit1.Paragraph.FirstIndent := 10;
  RxRichEdit1.Paragraph.LeftIndent := 25;
  RxRichEdit1.Paragraph.RightIndent := 25;

  RxRichEdit1.SelStart := 0;

  FTexto := RxRichEdit1.Lines.Text;

end;

procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
  RxRichEdit1.Clear;
end;

procedure TFormPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    RxRichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TFormPrincipal.SpeedButton4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    RxRichEdit1.SelAttributes.Color := ColorDialog1.Color;
end;

procedure TFormPrincipal.SpeedButton5Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    RxRichEdit1.Font := FontDialog1.Font;
end;

procedure TFormPrincipal.SpeedButton6Click(Sender: TObject);
begin
  RxRichEdit1.Paragraph.Alignment := paLeftJustify
end;

procedure TFormPrincipal.SpeedButton7Click(Sender: TObject);
begin
  RxRichEdit1.Paragraph.Alignment := paCenter
end;

procedure TFormPrincipal.SpeedButton8Click(Sender: TObject);
begin
  RxRichEdit1.Paragraph.Alignment := paRightJustify;
end;

procedure TFormPrincipal.SpeedButton9Click(Sender: TObject);
begin
  if not(fsBold in RxRichEdit1.SelAttributes.Style) then
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style
      + [fsBold]
  else
    RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style
      - [fsBold]
end;

end.
