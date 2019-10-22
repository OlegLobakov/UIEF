page 50011 "UI Element Viewer Factbox"
{
    PageType = CardPart;
    UsageCategory = None;
    SourceTable = "UI Element";

    layout
    {
        area(Content)
        {
            usercontrol(Viewer; UIEFx400)
            {
                ApplicationArea = All;

                trigger ControlAddinIsReady()
                begin
                    ControlAddInIsReady := true;
                    Build();
                end;

                trigger ControlAddinIsStarted()
                begin

                end;

                trigger ControlAddinIsRecreated()
                begin

                end;

                trigger ControlAddinIsRefreshed()
                begin

                end;

                trigger ControlAddinIsBusy(state: Boolean)
                begin

                end;

                trigger OnError(errortext: Text)
                begin
                    UIEF.LogJSEvent(Code, 'error', errortext);
                end;

                trigger OnUIEvent(id: code[50]; data: Text)
                begin
                    UIEF.LogJSEvent(Code, id, data);
                end;

                trigger OnJSEvent(id: code[50]; data1: Text; data2: Text; data3: Text; data4: Text)
                begin
                    UIEF.LogJSEvent(Code, id, data1);
                end;

                trigger OnHTML(html: Text)
                begin
                    Message(html);
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(HTML)
            {
                Caption = 'HTML';
                ToolTip = 'Get HTML of container';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = MiniForm;
                trigger OnAction()
                begin
                    CurrPage.Viewer.GetHTML();
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        IF ControlAddInIsReady THEN
            Build();
    end;

    local procedure Build()
    begin
        CurrPage.Viewer.Reset();
        CurrPage.Viewer.Setmode(1);
        CurrPage.Viewer.LoadCSS(FORMAT(CREATEGUID()), GetCSS());
        CurrPage.Viewer.CreateAndAppendToRoot('x', GetHTMLwithDebugValues());
        CurrPage.Viewer.Run(GetJS());
    end;

    var
        UIEF: Codeunit UIEF;
        ControlAddInIsReady: Boolean;
}