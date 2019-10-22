page 50012 "UI Element Viewer"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "UI Element";

    layout
    {
        area(Content)
        {
            usercontrol(Viewer; UIEF)
            {
                ApplicationArea = All;

                trigger ControlAddinIsReady()
                begin
                    ControlAddInIsReady := true;
                    Build();
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
        CurrPage.Viewer.CreateAndAppendToRoot('', GetHTMLwithDebugValues());
        CurrPage.Viewer.LoadCSS(FORMAT(CREATEGUID()), GetCSS());
        CurrPage.Viewer.Run(GetJS());
    end;

    var
        ControlAddInIsReady: Boolean;
}