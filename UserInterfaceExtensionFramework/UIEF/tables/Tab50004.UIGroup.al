table 50004 "UI Group"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "UI Group List";
    LookupPageId = "UI Group List";

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(3; "UIE Framework"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}