page 50005 "UI Element List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "UI Element";
    CardPageId = "UI Element Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field(Group; Group)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
            part(uieffb; "UI Element Viewer Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Code" = field("Code");
                Caption = 'View';
            }
        }
    }


    actions
    {
        area(Processing)
        {

            action(View)
            {
                Caption = 'View';
                ToolTip = 'View UI element';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = MiniForm;
                RunObject = page "UI Element Viewer";
                RunPageLink = "Code" = field(code);
            }
            group("F&unctions")
            {
                action(Copy)
                {
                    Caption = 'Copy';
                    ToolTip = 'Copy UI Element';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Image = CopyDocument;
                    RunObject = page "UI Element Viewer";
                    RunPageLink = "Code" = field(code);
                }
            }
            action(Import)
            {
                Caption = 'Import';
                ToolTip = 'Import UI Elements from xml file.';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = Import;

                trigger OnAction()
                var
                    UIEF: Codeunit UIEF;
                begin
                    UIEF.ImportUIElements();
                    CurrPage.Update();
                end;
            }
            action(Export)
            {
                Caption = 'Export';
                ToolTip = 'Export UI Elements to xml file.';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                var
                    UIElement: record "UI Element";
                    UIEF: Codeunit UIEF;
                begin
                    UIElement.RESET();
                    UIElement.SETRANGE(Code, Code);
                    UIElement.FindFirst();
                    CurrPage.SETSELECTIONFILTER(UIElement);
                    UIElement.MARKEDONLY(TRUE);
                    UIEF.ExportUIElements(UIElement);
                end;

            }
        }
    }
}