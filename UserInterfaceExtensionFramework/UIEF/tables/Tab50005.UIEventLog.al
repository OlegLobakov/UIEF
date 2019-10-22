table 50005 "UI Event Log"
{
    DataClassification = CustomerContent;

    fields
    {

        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }

        field(3; "ID"; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Event"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(5; "Registration DateTime"; Datetime)
        {
            DataClassification = CustomerContent;
        }

        field(6; "USER ID"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code, "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Registration Datetime" := CurrentDateTime();
        "User ID" := CopyStr(UserId(), 1, 50);
    end;
}