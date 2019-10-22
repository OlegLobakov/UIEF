page 50001 "UI Element HTML Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "UI Element HTML";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                IndentationColumn = Indentation;
                IndentationControls = HTML;
                field(HTML; HTML)
                {
                    ApplicationArea = All;
                    Width = 70;
                }

                field(DebugValue; "Debug Value")
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
            action(ReduceIndentation)
            {
                ApplicationArea = All;
                Caption = '-';
                ToolTip = 'Reduce the indentation of the line.';
                Image = Indent;
                trigger OnAction();
                begin
                    ReduceIndentation();
                end;
            }
            action(IncreaseIntentation)
            {
                ApplicationArea = All;
                Caption = '+';
                ToolTip = 'Increase the indentation of the line.';
                Image = Indent;
                trigger OnAction();
                begin
                    IncreaseIntentation();
                end;
            }

            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Import';
                ToolTip = 'Import HTML lines from *.txt file';
                Image = Indent;
                trigger OnAction();
                var
                    UIEF: Codeunit UIEF;
                    UIElementCode: code[20];
                begin
                    FilterGroup(4);
                    UIElementCode := CopyStr(Rec.GetFilter("UI Element Code"), 1, 20);
                    FilterGroup(0);
                    UIEF.LoadHTMLFromFile(UIElementCode);
                end;
            }
        }
    }
}