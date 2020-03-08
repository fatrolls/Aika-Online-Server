unit Log;

interface

uses Vcl.StdCtrls, Windows;

type TLogType = (Packets, ConnectionsTraffic, Warnings, ServerStatus);

type TLog = class(TObject)
  public
    procedure Clear();
    procedure Write(str : string; logType : TLogType); overload;
    procedure Write(obj : TObject; logType : TLogType); overload;
    procedure Space(logType: TLogType);
end;

implementation
{ TLog }

uses GlobalDefs;

procedure TLog.Clear;
begin
  //GameServerForm.PacketsListBox.Clear;
  //GameServerForm.ConnectionsListBox.Clear;
  //GameServerForm.WarningsListBox.Clear;
  //GameServerForm.ServerStatusListBox.Clear;
end;

procedure TLog.Write(str: string; logType : TLogType);
begin
  case logType of
    Packets:
    begin
      Writeln(str);
    end;

    ConnectionsTraffic:
    begin
     Writeln(str);
    end;

    Warnings:
    begin
      SetConsoleTextAttribute(GetStdHandle(
                          STD_OUTPUT_HANDLE),
                          FOREGROUND_RED OR
                          FOREGROUND_INTENSITY);
      Writeln(str);

      SetConsoleTextAttribute(GetStdHandle(
                          STD_OUTPUT_HANDLE),
                          FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_BLUE);
    end;

    ServerStatus:
    begin
      Writeln(str);
    end;
  end;
end;

procedure TLog.Space(logType: TLogType);
begin
  Write('--------------------------------------------------------------', logType);
end;

procedure TLog.Write(obj: TObject; logType: TLogType);
begin
  Write(obj.ToString(), logType);
end;

end.
