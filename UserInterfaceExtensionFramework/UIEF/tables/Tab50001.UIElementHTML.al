table 50001 "UI Element HTML"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "UI Element Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "UI Element";
        }

        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(3; "HTML"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(4; Indentation; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(5; "Debug Value"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "UI Element Code", "Line No.")
        {
            Clustered = true;
        }
    }

    procedure ReduceIndentation()
    begin
        if Indentation - 1 >= 0 then
            Indentation := Indentation - 1;
    end;

    procedure IncreaseIntentation()
    begin
        Indentation := Indentation + 1;
    end;
}