table 50000 "UI Element"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "UI Element list";
    LookupPageId = "UI Element list";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }


        field(2; Description; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(3; URL; Text[250])
        {
            DataClassification = CustomerContent;

        }

        field(4; "Group"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "UI Group";
        }
    }

    keys
    {
        key(PrimaryKey; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        DeleteContent();
    end;

    procedure DeleteContent()
    var
        UIElementHTML: Record "UI Element HTML";
        UIElementJS: Record "UI Element JS";
        UIElementCSS: Record "UI Element CSS";
    begin
        UIElementHTML.SetRange("UI Element Code", Code);
        UIElementHTML.DeleteAll(true);
        UIElementJS.SetRange("UI Element Code", Code);
        UIElementJS.DeleteAll(true);
        UIElementCSS.SetRange("UI Element Code", Code);
        UIElementCSS.DeleteAll(true);
    end;

    procedure GetHTML(): Text
    var
        UIElementHTML: Record "UI Element HTML";
        html: Text;
    begin
        UIElementHTML.RESET();
        UIElementHTML.SETRANGE("UI Element Code", Code);
        if UIElementHTML.FINDSET(false) then
            repeat
                html += UIElementHTML.HTML;
            until UIElementHTML.NEXT() = 0;
        exit(html);
    end;

    procedure GetHTMLwithDebugValues(): Text
    var
        UIElementHTML: Record "UI Element HTML";
        html: Text;
        StartPos: Integer;
        EndPos: Integer;
    begin
        UIElementHTML.RESET();
        UIElementHTML.SETRANGE("UI Element Code", Code);
        IF UIElementHTML.FINDSET(false) then
            repeat
                StartPos := STRPOS(UIElementHTML.HTML, '{');
                EndPos := STRPOS(UIElementHTML.HTML, '}');
                if (StartPos <> 0) AND (EndPos <> 0) then
                    html += COPYSTR(UIElementHTML.HTML, 1, StartPos - 1) + UIElementHTML."Debug Value" + COPYSTR(UIElementHTML.HTML, EndPos + 1)
                else
                    html += UIElementHTML.HTML;
            until UIElementHTML.NEXT() = 0;
        exit(html);
    end;

    procedure GetJS(): Text
    var
        UIElementJS: Record "UI Element JS";
        js: Text;
    begin
        UIElementJS.RESET();
        UIElementJS.SETRANGE("UI Element Code", Code);
        if UIElementJS.FINDSET(false) then
            repeat
                js += UIElementJS.Javascript;
            until UIElementJS.NEXT() = 0;
        exit(js);
    end;

    procedure GetCSS(): Text
    var
        UIElementCSS: Record "UI Element CSS";
        css: Text;
    begin
        UIElementCSS.RESET();
        UIElementCSS.SETRANGE("UI Element Code", Code);
        if UIElementCSS.FINDSET(false) then
            repeat
                css += UIElementCSS.CSS;
            until UIElementCSS.NEXT() = 0;
        exit(css);
    end;
}