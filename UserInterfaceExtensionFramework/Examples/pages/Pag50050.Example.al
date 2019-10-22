page 50050 ExampleUIEF
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 21;

    layout
    {
        area(Content)
        {
            group(ExampleUIEF)
            {
                usercontrol(Viewer; UIEFx400)
                {
                    ApplicationArea = All;

                    trigger ControlAddinIsReady()
                    begin
                        ControlAddInIsReady := true;
                        Build();
                    end;

                    trigger OnJSEvent(id: Code[50]; data1: Text; data2: Text; data3: Text; data4: Text)
                    begin
                        Message(id + ' ' + data1);
                    end;

                    trigger OnError(errortext: Text)
                    begin
                        Message(errortext);
                    end;

                    trigger OnUIEvent(id: Code[50]; data: Text)
                    begin
                        Message(id + ' ' + data);
                    end;

                    trigger OnHTML(html: Text)
                    begin
                        Message(html);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin

    end;

    local procedure Build()
    var
        uiid: Text;
    begin
        CurrPage.Viewer.Reset();
        if UIElement.get(OUIFBtnTok) then begin
            uiid := 'A1';
            CurrPage.Viewer.CreateAndAppendToRoot(uiid, UIElement.GetHTML());
            CurrPage.Viewer.SetText('#' + uiid + ' .' + 'ms-Button-label', 'Create');
            uiid := 'A2';
            CurrPage.Viewer.CreateAndAppendToRoot(uiid, UIElement.GetHTML());
            CurrPage.Viewer.SetText('#' + uiid + ' .' + 'ms-Button-label', 'Edit');
            uiid := 'A3';
            CurrPage.Viewer.CreateAndAppendToRoot(uiid, UIElement.GetHTML());
            CurrPage.Viewer.SetText('#' + uiid + ' .' + 'ms-Button-label', 'Delete');
        end;
        CurrPage.Viewer.Run(UIElement.GetJS());
    end;

    var
        UIElement: record "UI Element";
        ControlAddInIsReady: Boolean;
        OUIFBtnTok: Label 'OUIF-BTN-C', Locked = true;
}