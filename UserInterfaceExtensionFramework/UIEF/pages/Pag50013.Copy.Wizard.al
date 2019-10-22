page 50013 "Copy UI Element Wizard"
{
    PageType = NavigatePage;
    Caption = 'Copy UI Element Wizard';
    SourceTable = "UI Element";

    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and (FirstPageVisible OR SecondPageVisible);

                field(MRS; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinalPageVisible;

                field(MRD; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(FirstPage)
            {
                Caption = '';
                Visible = FirstPageVisible;

                group("Welcome")
                {
                    Caption = 'Welcome';
                    Visible = FirstPageVisible;

                    group(Introduction)
                    {
                        Caption = '';
                        InstructionalText = 'Welcome to UI Element Copy Wizard';
                        Visible = FirstPageVisible;

                        field(Spacer1; '')
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            Editable = false;
                            MultiLine = true;
                        }
                    }

                    group(Terms2)
                    {
                        Caption = '';

                        field(UICode; Code)
                        {
                            ApplicationArea = All;
                            Editable = false;
                            Caption = 'Code';
                        }
                        field(UIDescription; Description)
                        {
                            ApplicationArea = All;
                            MultiLine = true;
                            Editable = false;
                            Caption = 'Description';
                        }
                    }
                }
            }

            group(SecondPage)
            {
                Caption = '';
                Visible = SecondPageVisible;

                group("Activation")
                {
                    Caption = 'Select';
                    Visible = SecondPageVisible;

                    group(ActivationMessage)
                    {
                        Caption = '';
                        InstructionalText = 'Select action type.';
                        Visible = SecondPageVisible;

                        field(CopyModeCreatefield; CopyModeCreate)
                        {
                            ApplicationArea = All;
                            Editable = true;
                            Caption = 'Create new UI Element';
                            trigger OnValidate()
                            begin
                                if CopyModeCreate then
                                    CopyModeReplace := false
                                else
                                    CopyModeCreate := true;
                            end;
                        }
                        field(NewUIElementCodefield; NewUIElementCode)
                        {
                            ApplicationArea = All;
                            Enabled = CopyModeCreate;
                            Caption = 'UI Element Code';
                            trigger OnValidate()
                            begin
                                ValidateNewUIElementCode();
                            end;
                        }
                        field(NewUIElementDescriptiondield; NewUIElementDescription)
                        {
                            ApplicationArea = All;
                            Enabled = CopyModeCreate;
                            Caption = 'UI Element Description';
                        }
                        field(CopyModeReplacefield; CopyModeReplace)
                        {
                            ApplicationArea = All;
                            Enabled = true;
                            Caption = 'Copy to existing UI Element';
                            trigger OnValidate()
                            begin
                                if CopyModeReplace then
                                    CopyModeCreate := false
                                else
                                    CopyModeReplace := true;
                                NewUIElementCode := '';
                                NewUIElementDescription := '';
                            end;
                        }

                        field(ExistingUIElementCodefield; ExistingUIElementCode)
                        {
                            ApplicationArea = All;
                            Enabled = CopyModeReplace;
                            Editable = CopyModeReplace;
                            Caption = 'UI Element Code';
                            trigger OnLookup(var Text: Text): Boolean
                            var
                                UIElement: Record "UI Element";
                                UIElementList: page "UI Element List";
                            begin
                                UIElement.RESET();
                                UIElement.FILTERGROUP(2);
                                UIElement.SETFILTER(Code, '<>%1', Code);
                                UIElement.FILTERGROUP(0);
                                IF UIElement.FINDFIRST() THEN;
                                CLEAR(UIElementList);
                                UIElementList.LOOKUPMODE(TRUE);
                                UIElementList.SETTABLEVIEW(UIElement);
                                IF UIElementList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                                    UIElementList.GETRECORD(UIElement);
                                    ExistingUIElementCode := UIElement.Code;
                                    ValidateUIElementCode(ExistingUIElementCode);
                                END;
                            end;
                        }
                        field(ExistingUIElementDescriptionfield; ExistingUIElementDescription)
                        {
                            ApplicationArea = All;
                            Editable = false;
                            Enabled = CopyModeReplace;
                            Caption = 'Description';
                        }

                        field(DeleteExistingLinefield; DeleteExistingLine)
                        {
                            ApplicationArea = All;
                            Editable = CopyModeReplace;
                            Enabled = CopyModeReplace;
                            Caption = 'Delete existing lines';
                        }
                    }
                }
            }

            group(FinalPage)
            {
                Caption = '';
                Visible = FinalPageVisible;

                group("ActivationDone")
                {
                    Caption = 'Done!';
                    Visible = FinalPageVisible;

                    group(DoneMessage)
                    {
                        Caption = '';
                        InstructionalText = 'Click Finish to close wizard.';
                        Visible = FinalPageVisible;
                    }

                    field(OpenUI; OpenUIAfterFinish)
                    {
                        ApplicationArea = All;
                        Caption = 'Open copied UI Element';
                        ToolTip = 'Open UI Element Card for new UI element after wizard close.';
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackEnabled;
                Visible = BackEnabled;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    NextStep(true);
                end;
            }

            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextEnabled;
                Visible = NextEnabled;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    NextStep(false);
                end;
            }

            action(ActionActivate)
            {
                ApplicationArea = All;
                Caption = 'Copy';
                Enabled = CopyActionEnabled;
                Visible = CopyActionEnabled;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    IF CopyModeCreate THEN BEGIN
                        IF (NewUIElementCode = '') OR (NewUIElementDescription = '') then
                            error(SelectUIElementCodeAndDescriptionErr);
                        NewUIElement.INIT();
                        NewUIElement.Code := NewUIElementCode;
                        NewUIElement.Description := NewUIElementDescription;
                        NewUIElement.Group := Group;
                        NewUIElement.URL := URL;
                        NewUIElement.INSERT(TRUE);
                    END;

                    IF CopyModeReplace THEN BEGIN
                        IF (ExistingUIElementCode = '') then
                            Error(SelectExistUIElementCodeErr);
                        NewUIElement.GET(ExistingUIElementCode);
                        NewUIElement.TRANSFERFIELDS(Rec);
                        NewUIElement.Code := ExistingUIElementCode;
                        NewUIElement.Description := ExistingUIElementDescription;
                        NewUIElement.MODIFY(TRUE);
                    END;
                    UIEF.CopyUIElement(Code, NewUIElement.Code, DeleteExistingLine);

                    NextStep(false);
                end;
            }

            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishEnabled;
                Visible = FinishEnabled;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction();
                begin
                    FinishAndEnableCustomerRewards()
                end;
            }
        }
    }

    trigger OnInit();
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage();
    begin
        Step := Step::First;
        OpenUIAfterFinish := true;
        CopyModeCreate := true;
        CopyModeReplace := false;
        EnableControls();
    end;

    local procedure EnableControls();
    begin
        ResetControls();

        case Step of
            Step::First:
                ShowFirstPage();

            Step::Second:
                ShowSecondPage();

            Step::Finish:
                ShowFinalPage();
        END;
    end;

    local procedure NextStep(Backwards: Boolean);
    begin
        if Backwards then
            Step := Step - 1
        ELSE
            Step := Step + 1;
        EnableControls();
    end;

    local procedure FinishAndEnableCustomerRewards()
    begin
        if OpenUIAfterFinish then
            PAGE.RUN(PAGE::"UI Element Card", NewUIElement);
        CurrPage.Close();
    end;

    local procedure ShowFirstPage();
    begin
        FirstPageVisible := true;
        SecondPageVisible := false;
        FinishEnabled := false;
        BackEnabled := false;
        NextEnabled := true;
        CopyActionEnabled := false;
        FinishEnabled := true;
    end;

    local procedure ShowSecondPage();
    begin
        FirstPageVisible := false;
        SecondPageVisible := true;
        FinishEnabled := false;
        BackEnabled := true;
        NextEnabled := false;
        CopyActionEnabled := true;
        FinishEnabled := true;
    end;

    local procedure ShowFinalPage();
    begin
        FinalPageVisible := true;
        BackEnabled := false;
        NextEnabled := false;
        CopyActionEnabled := false;
    end;

    local procedure ResetControls();
    begin
        FinishEnabled := true;
        BackEnabled := true;
        NextEnabled := true;
        CopyActionEnabled := true;
        FirstPageVisible := false;
        SecondPageVisible := false;
        FinalPageVisible := false;
    end;

    local procedure LoadTopBanners();
    begin
        if MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE())) and
            MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE()))
        then
            if MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") and
                MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref")
            then
                TopBannerVisible := MediaResourcesDone."Media Reference".HASVALUE();
    end;

    local procedure ValidateUIElementCode(UIElementCode: code[20])
    var
        UIElement: Record "UI Element";
    begin
        IF UIElement.GET(UIElementCode) THEN BEGIN
            ExistingUIElementCode := UIElement.Code;
            ExistingUIElementDescription := UIElement.Description;
        END ELSE BEGIN
            ExistingUIElementCode := '';
            ExistingUIElementDescription := '';
        END;
    end;

    local procedure ValidateNewUIElementCode()
    var
        UIElement: Record "UI Element";
    begin
        IF UIElement.GET(NewUIElementCode) THEN
            ERROR(ErrorUIElementExistErr);
    end;

    var
        MediaRepositoryStandard: Record "Media Repository";
        MediaRepositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";

        NewUIElement: Record "UI Element";

        UIEF: Codeunit UIEF;
        Step: Option First,Second,Finish;
        TopBannerVisible: Boolean;
        FirstPageVisible: Boolean;
        SecondPageVisible: Boolean;
        FinalPageVisible: Boolean;
        FinishEnabled: Boolean;
        BackEnabled: Boolean;
        NextEnabled: Boolean;
        CopyActionEnabled: Boolean;
        CopyModeCreate: Boolean;
        CopyModeReplace: Boolean;
        DeleteExistingLine: Boolean;
        OpenUIAfterFinish: Boolean;

        NewUIElementCode: Code[20];
        NewUIElementDescription: Text[250];

        ExistingUIElementCode: code[20];
        ExistingUIElementDescription: Text[250];

        ErrorUIElementExistErr: Label 'UI Element already exist!';
        SelectUIElementCodeAndDescriptionErr: Label 'Specify New UI Element Code and Description.';
        SelectExistUIElementCodeErr: Label 'Select an existing UI Element.';
}
