unit frmMediaPlayer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer, Vcl.StdCtrls;

type
  TfrmKagbaMediaPlayer = class(TForm)
    pnlTop: TPanel;
    lblHeader: TLabel;
    openDialogBox: TOpenDialog;
    mediaPlayer: TMediaPlayer;
    btnLoad: TButton;
    tTimer: tTimer;
    scrollBar: TScrollBar;
    pnlMedia: TPanel;
    cbxLoop: TCheckBox;
    tLoop: TTimer;
    procedure btnLoadClick(Sender: TObject); // Corrected the procedure here
    procedure tTimerTimer(Sender: TObject);
    procedure pnlMediaResize(Sender: TObject);
    procedure scrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure tLoopTimer(Sender: TObject);
  private
    { Private declarations }
  var
    bBoolean: boolean;
  public
    { Public declarations }
  end;

var
  frmKagbaMediaPlayer: TfrmKagbaMediaPlayer;

implementation

{$R *.dfm}

procedure TfrmKagbaMediaPlayer.btnLoadClick(Sender: TObject);
begin
  if openDialogBox.Execute then
  begin
    openDialogBox.InitialDir := ExtractFilePath(Application.ExeName);

    if not FileExists(openDialogBox.FileName) then
    // FIXED: Check if file exists
    begin
      ShowMessage('File not found!');
      // FIXED: Error message if the file doesn't exist
      Exit; // FIXED: Exit the procedure if the file doesn't exist
    end;

    tTimer.Enabled := False; // Disabling timer for the scroll bar at bottom

    try
      mediaPlayer.FileName := openDialogBox.FileName;
      // OPEN: Open the selected media file
      mediaPlayer.Open; // OPEN: Initialize the media file and check for errors

      mediaPlayer.Display := pnlMedia; // Where the media player shows the video
      mediaPlayer.DisplayRect := pnlMedia.ClientRect;

      scrollBar.Max := mediaPlayer.TrackLength[1];
      // Setting scroll bar max length to the media length
      tTimer.Enabled := True; // Re-enable the timer for the scroll bar
    except
      on E: Exception do
        ShowMessage('Error initializing MCI: ' + E.Message);
      // FIXED: Catch and display any MCI initialization errors
    end;
  end;
end;

procedure TfrmKagbaMediaPlayer.pnlMediaResize(Sender: TObject);
begin
  mediaPlayer.DisplayRect := pnlMedia.ClientRect;
  // Adjust the media player's display area when resizing
end;

procedure TfrmKagbaMediaPlayer.scrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  mediaPlayer.position := scrollBar.position;
  // Move the media player position based on scroll bar
  mediaPlayer.Play; // Play the media
end;

procedure TfrmKagbaMediaPlayer.tLoopTimer(Sender: TObject);
begin
  if (cbxLoop.checked) AND (mediaPlayer.Mode = mpStopped) then
  begin
  MediaPlayer.Play; // Restart video if checkbox is checked
  end;
end;

procedure TfrmKagbaMediaPlayer.tTimerTimer(Sender: TObject);
begin
  // All of this happens every 30 milliseconds (due to the timer component)
  scrollBar.position := mediaPlayer.position;
  // Set the scroll bar's position to the media player's position

  if mediaPlayer.position = scrollBar.Max then
  // If the media player reaches the end, stop the video
  begin
    mediaPlayer.Stop;
  end;
end;

end.
