page 50000 "UI Element Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "UI Element";
    PromotedActionCategories = 'New,Process,Report,Output,Edit,Build,Functions';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the UI Element.';
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description for the UI Element.';
                }
                field(Group; Group)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description for the UI Element.';
                }
                field(URL; URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'Link to element description';
                    ExtendedDatatype = URL;
                }
            }

            part(htmlsubform; "UI Element HTML Subform")
            {
                ApplicationArea = All;
                Editable = IsEditable;
                Caption = 'HTML';
                SubPageLink = "UI Element Code" = field("Code");
            }
            part(jssubform; "UI Element JS Subform")
            {
                ApplicationArea = All;
                Editable = IsEditable;
                Caption = 'Javascript';
                SubPageLink = "UI Element Code" = field("Code");
            }
            part(csssubform; "UI Element CSS Subform")
            {
                ApplicationArea = All;
                Editable = IsEditable;
                Caption = 'CSS';
                SubPageLink = "UI Element Code" = field("Code");
            }
        }
        area(FactBoxes)
        {
            part(uieffb; "UI Element Viewer Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Code" = field("Code");
                Caption = 'View';
            }
            part(eventsfb; "UI Element Events Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Code" = field("Code");
                Caption = 'Events';
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

            action(Copy)
            {
                Caption = 'Copy';
                ToolTip = 'Copy UI Element';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = CopyDocument;
                RunObject = page "Copy UI Element Wizard";
                RunPageLink = "Code" = field(code);
            }

            action(Import)
            {
                Caption = 'Import';
                ToolTip = 'Import UI Element from xml file.';
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
                ToolTip = 'Export UI Element to xml file.';
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
                    UIEF.ExportUIElements(UIElement);
                end;

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IsEditable := CurrPage.EDITABLE();
    end;

    var
        IsEditable: Boolean;

}