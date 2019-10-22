codeunit 50003 "UI Examples Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        Codeunit.run(Codeunit::"UI Examples Library");
    end;
}