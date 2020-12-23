unit FmAbout;
{===============================================================================
  Модуль      : FmAbout
  Description : Form "About the program"
  Описание    : Форма "О программе"
===============================================================================}


interface

uses
  {VCL}
  Winapi.Windows,
  Vcl.StdCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,
  System.Classes,
  Vcl.Forms;

type
  /// <summary>
  /// <para> Form "About the program" </para>
  /// <para> Форма "О программе" </para>
  /// </summary>
  TFm_About = class(TForm)
    Pnl_About: TPanel;
    ProgramIcon: TImage;
    Lbl_ProductName: TLabel;
    Lbl_Version: TLabel;
    Lbl_Copyright: TLabel;
    Lbl_Comments: TLabel;
    Btn_Close: TButton;
  end; { TFm_About }

implementation

{$R *.dfm}

end.
 
