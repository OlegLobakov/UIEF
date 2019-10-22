xmlport 50001 "Import/Export UI Element"
{
    Format = xml;
    Encoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(UIElements)
        {
            tableelement(uielement; "UI Element")
            {
                XmlName = 'UIElement';


                fieldattribute(url; uielement.URL)
                {
                    XmlName = 'URL';
                }
                fieldattribute(description; uielement.Description)
                {
                    XmlName = 'Description';
                }
                fieldattribute(Code; uielement.Code)
                {
                    XmlName = 'Code';
                }
                fieldattribute(Group; uielement.Group)
                {
                    XmlName = 'Group';
                }
                textelement(HTML)
                {
                    tableelement(htmlline; "UI Element HTML")
                    {
                        XmlName = 'Line';
                        LinkTable = uielement;
                        LinkFields = "UI Element Code" = FIELD("Code");

                        fieldattribute(uicode; htmlline."UI Element Code")
                        {
                            XmlName = 'UIC';
                        }
                        fieldattribute(indentation; htmlline.Indentation)
                        {
                            XmlName = 'Indentation';
                        }
                        fieldattribute(html; htmlline.HTML)
                        {
                            XmlName = 'Text';
                        }
                        fieldattribute(Lineno; htmlline."Line No.")
                        {
                            XmlName = 'LineNo';
                        }

                    }
                }
                textelement(Javascript)
                {
                    tableelement(jsline; "UI Element JS")
                    {
                        XmlName = 'Line';
                        LinkTable = uielement;
                        LinkFields = "UI Element Code" = FIELD("Code");

                        fieldattribute(uicode; jsline."UI Element Code")
                        {
                            XmlName = 'UIC';
                        }
                        fieldattribute(indentation; jsline.Indentation)
                        {
                            XmlName = 'Indentation';
                        }
                        fieldattribute(html; jsline.Javascript)
                        {
                            XmlName = 'Text';
                        }
                        fieldattribute(Lineno; jsline."Line No.")
                        {
                            XmlName = 'LineNo';
                        }
                    }
                }
                textelement(CSS)
                {
                    tableelement(cssline; "UI Element CSS")
                    {
                        XmlName = 'CSS';
                        LinkTable = uielement;
                        LinkFields = "UI Element Code" = FIELD("Code");

                        fieldattribute(uicode; cssline."UI Element Code")
                        {
                            XmlName = 'UIC';
                        }
                        fieldattribute(indentation; cssline.Indentation)
                        {
                            XmlName = 'Indentation';
                        }
                        fieldattribute(css; cssline.CSS)
                        {
                            XmlName = 'Text';
                        }
                        fieldattribute(Lineno; cssline."Line No.")
                        {
                            XmlName = 'LineNo';
                        }
                    }
                }
            }
        }
    }
}