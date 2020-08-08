unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.Buttons, Vcl.StdCtrls,
  RxRichEd, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RxRichEdit1: TRxRichEdit;
    SpeedButton1: TSpeedButton;
    OpenTextFileDialog1: TOpenTextFileDialog;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute then
  begin

    RxRichEdit1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);

    RxRichEdit1.SelectAll;
    RxRichEdit1.Paragraph.FirstIndent := 10;
    RxRichEdit1.Paragraph.LeftIndent := 15;
    RxRichEdit1.Paragraph.RightIndent := 15;

    RxRichEdit1.SelStart := 0;

  end;


end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin

  RxRichEdit1.Paragraph.Alignment := paCenter;

end;

end.
