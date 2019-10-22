codeunit 50001 UIEF
{
    procedure CopyUIElement(FromUIElementCode: Code[20]; ToUIElementCode: Code[20]; DeleteExistingLines: Boolean)
    var
        FromUIElement: Record "UI Element";
        ToUIElement: Record "UI Element";
        FromUIElementHTML: Record "UI Element HTML";
        ToUIElementHTML: Record "UI Element HTML";
        FromUIElementJS: Record "UI Element JS";
        ToUIElementJS: Record "UI Element JS";
        FromUIElementCSS: Record "UI Element CSS";
        ToUIElementCSS: Record "UI Element CSS";
        LineNo: Integer;
    begin
        IF FromUIElementCode = ToUIElementCode THEN
            EXIT;

        FromUIElement.GET(FromUIElementCode);
        ToUIElement.GET(ToUIElementCode);

        IF DeleteExistingLines THEN
            ToUIElement.DeleteContent();

        LineNo := 10000;
        ToUIElementHTML.RESET();
        ToUIElementHTML.SETRANGE("UI Element Code", ToUIElementCode);
        IF ToUIElementHTML.FINDFIRST() THEN
            LineNo := ToUIElementHTML."Line No." + 10000;
        FromUIElementHTML.RESET();
        FromUIElementHTML.SETRANGE("UI Element Code", FromUIElementCode);
        IF FromUIElementHTML.FINDSET(FALSE) THEN
            REPEAT
                ToUIElementHTML.INIT();
                ToUIElementHTML.TRANSFERFIELDS(FromUIElementHTML, FALSE);
                ToUIElementHTML."UI Element Code" := ToUIElementCode;
                ToUIElementHTML."Line No." := LineNo;
                ToUIElementHTML.INSERT(TRUE);
                LineNo += 10000;
            UNTIL FromUIElementHTML.NEXT() = 0;


        LineNo := 10000;
        ToUIElementJS.RESET();
        ToUIElementJS.SETRANGE("UI Element Code", ToUIElementCode);
        IF ToUIElementJS.FINDFIRST() THEN
            LineNo := ToUIElementJS."Line No." + 10000;
        FromUIElementJS.RESET();
        FromUIElementJS.SETRANGE("UI Element Code", FromUIElementCode);
        IF FromUIElementJS.FINDSET(FALSE) THEN
            REPEAT
                ToUIElementJS.INIT();
                ToUIElementJS.TRANSFERFIELDS(FromUIElementJS, FALSE);
                ToUIElementJS."UI Element Code" := ToUIElementCode;
                ToUIElementJS."Line No." := LineNo;
                ToUIElementJS.INSERT(TRUE);
                LineNo += 10000;
            UNTIL FromUIElementJS.NEXT() = 0;

        LineNo := 10000;
        ToUIElementCSS.RESET();
        ToUIElementCSS.SETRANGE("UI Element Code", ToUIElementCode);
        IF ToUIElementCSS.FINDFIRST() THEN
            LineNo := ToUIElementCSS."Line No." + 10000;
        FromUIElementCSS.RESET();
        FromUIElementCSS.SETRANGE("UI Element Code", FromUIElementCode);
        IF FromUIElementCSS.FINDSET(FALSE) THEN
            REPEAT
                ToUIElementCSS.INIT();
                ToUIElementCSS.TRANSFERFIELDS(FromUIElementCSS, FALSE);
                ToUIElementCSS."UI Element Code" := ToUIElementCode;
                ToUIElementCSS."Line No." := LineNo;
                ToUIElementCSS.INSERT(TRUE);
                LineNo += 10000;
            UNTIL FromUIElementCSS.NEXT() = 0;
    end;

    procedure ImportUIElements()
    begin
        XMLPORT.RUN(XMLPORT::"Import/Export UI Element", FALSE, TRUE);
    end;

    procedure LoadHTMLFromFile(UIElementCode: Code[20])
    var
        UIElementHTML: Record "UI Element HTML";
        LineNo: Integer;
        LocalFileName: Text;
        CurrentLine: Text;
        inStr: InStream;
        SelectImportHTMLFilenameMsg: Label 'Select file for import HTML lines';

    begin

        IF UIElementCode = '' THEN
            EXIT;

        IF UIElementHTML.FINDLAST() THEN;
        LineNo := UIElementHTML."Line No.";

        File.UploadIntoStream(SelectImportHTMLFilenameMsg, '', 'All files (*.*)|*.*', LocalFileName, inStr);
        While (NOT inStr.EOS()) do begin
            instr.ReadText(CurrentLine);
            REPEAT
                LineNo := LineNo + 10000;
                UIElementHTML.INIT();
                UIElementHTML."UI Element Code" := UIElementCode;
                UIElementHTML."Line No." := LineNo;
                UIElementHTML.HTML := CopyStr(CurrentLine, 1, 250);
                UIElementHTML.Indentation := GetIndentation(CurrentLine);
                UIElementHTML.INSERT(FALSE);
                CurrentLine := COPYSTR(CurrentLine, 250);
            UNTIL STRLEN(CurrentLine) = 0;
        end;
    end;

    procedure LoadJSFromFile(UIElementCode: Code[20])
    var
        UIElementJS: Record "UI Element JS";
        LineNo: Integer;
        LocalFileName: Text;
        CurrentLine: Text;
        inStr: InStream;
        SelectImportHTMLFilenameMsg: Label 'Select file for import HTML lines';

    begin

        IF UIElementCode = '' THEN
            EXIT;

        IF UIElementJS.FINDLAST() THEN;
        LineNo := UIElementJS."Line No.";

        File.UploadIntoStream(SelectImportHTMLFilenameMsg, '', 'All files (*.*)|*.*', LocalFileName, inStr);
        While (NOT inStr.EOS()) do begin
            instr.ReadText(CurrentLine);
            REPEAT
                LineNo := LineNo + 10000;
                UIElementJS.INIT();
                UIElementJS."UI Element Code" := UIElementCode;
                UIElementJS."Line No." := LineNo;
                UIElementJS.Javascript := CopyStr(CurrentLine, 1, 250);
                UIElementJS.Indentation := GetIndentation(CurrentLine);
                UIElementJS.INSERT(FALSE);
                CurrentLine := COPYSTR(CurrentLine, 250);
            UNTIL STRLEN(CurrentLine) = 0;
        end;
    end;

    procedure LoadCSSFromFile(UIElementCode: Code[20])
    var
        UIElementCSS: Record "UI Element CSS";
        LineNo: Integer;
        LocalFileName: Text;
        CurrentLine: Text;
        inStr: InStream;
        SelectImportHTMLFilenameMsg: Label 'Select file for import HTML lines';

    begin

        IF UIElementCode = '' THEN
            EXIT;

        IF UIElementCSS.FINDLAST() THEN;
        LineNo := UIElementCSS."Line No.";

        File.UploadIntoStream(SelectImportHTMLFilenameMsg, '', 'All files (*.*)|*.*', LocalFileName, inStr);
        While (NOT inStr.EOS()) do begin
            instr.ReadText(CurrentLine);
            REPEAT
                LineNo := LineNo + 10000;
                UIElementCSS.INIT();
                UIElementCSS."UI Element Code" := UIElementCode;
                UIElementCSS."Line No." := LineNo;
                UIElementCSS.CSS := CopyStr(CurrentLine, 1, 250);
                UIElementCSS.Indentation := GetIndentation(CurrentLine);
                UIElementCSS.INSERT(FALSE);
                CurrentLine := COPYSTR(CurrentLine, 250);
            UNTIL STRLEN(CurrentLine) = 0;
        end;
    end;

    local procedure GetIndentation(Buffer: Text): Integer
    var
        i: Integer;
        returnvalue: Integer;
        ByteCode: Byte;
    begin
        for i := 1 to STRLEN(Buffer) do begin
            ByteCode := Buffer[i];
            if (ByteCode = 9) then
                returnvalue += 4
            else
                if (ByteCode = 32) then
                    returnvalue += 1
                else
                    break;
        end;
        exit(returnvalue);
    end;

    procedure ExportUIElements(var UIElements: Record "UI Element")
    begin
        XMLPORT.RUN(XMLPORT::"Import/Export UI Element", FALSE, FALSE, UIElements);
    end;

    procedure LogJSEvent(Code: Code[20]; id: code[50]; text1: Text)
    var
        JSEventLog: record "UI Event Log";
    begin
        JSEventLog.INIT();
        JSEventLog.Code := Code;
        JSEventLog."Entry No." := 0;
        JSEventLog.ID := id;
        JSEventLog.Event := CopyStr(text1, 1, 100);
        JSEventLog.INSERT(TRUE);
    end;

    procedure Create(UIElementCode: Code[20]): Guid
    var
        id: guid;
    begin
        id := CreateGuid();
        exit(id);
    end;

    procedure Set(uief1: ControlAddIn UIEF)
    begin
        UIEF := uief1;
    end;

    //Новый формат вызовы предусматривающий что у компонента может быть свой id и не нужно его менять
    procedure AddUIToRoot(UIElementCode: Code[20]; AssignNewID: Boolean; RunJS: Boolean) id: Text
    var
        UIElement: record "UI Element";
    begin
        if UIElement.get(UIElementCode) then begin
            if AssignNewID then
                id := DelChr(CreateGuid(), '=', '{}-');
            UIEF.CreateAndAppendToRoot(id, UIElement.GetHTML());
            if RunJS then
                UIEF.Run(UIElement.GetJS());
        end;
        exit(id);
    end;

    procedure CreateAndAdd(UIElementCode: Code[20]; AddTo: Text; RunJS: Boolean): Text
    var
        UIElement: record "UI Element";
        id: Text;
    begin
        if UIElement.get(UIElementCode) then begin
            id := DelChr(CreateGuid(), '=', '{}-');
            UIEF.CreateAndAppend(id, AddTo, UIElement.GetHTML());
            if RunJS then
                UIEF.Run(UIElement.GetJS());
            exit(id);
        end;
        exit('');
    end;

    procedure RunJS(jscode: Text)
    begin
        UIEF.Run(jscode);
    end;

    var
        UIEF: ControlAddIn UIEF;
}