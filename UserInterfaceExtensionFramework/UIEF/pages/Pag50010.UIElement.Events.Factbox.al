page 50010 "UI Element Events Factbox"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "UI Event Log";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; ID)
                {
                    ApplicationArea = All;
                }
                field(events; "Event")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DeleteAll)
            {
                ApplicationArea = All;
                Caption = 'Delete All Events';
                ToolTip = 'Delete events from list';
                Image = Delete;
                trigger OnAction();
                var
                    UIEventLog: Record "UI Event Log";
                begin
                    UIEventLog.Reset();
                    UIEventLog.SetRange(Code, Code);
                    UIEventLog.DeleteAll(true);
                end;
            }
        }
    }
    local procedure Build()
    begin
    end;
}