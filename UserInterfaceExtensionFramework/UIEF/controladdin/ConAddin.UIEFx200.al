controladdin UIEFx200
{
    RequestedHeight = 200;
    MinimumHeight = 200;   //UIEFx200
    // MaximumHeight = 300;
    // RequestedWidth = 700;
    MinimumWidth = 100;
    // MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        'UIEF/controladdin/Scripts/picker.js',
        'UIEF/controladdin/Scripts/picker.date.js',
        'UIEF/controladdin/Scripts/fabric.min.js',
        'UIEF/controladdin/Scripts/colorbrewer.v1.min.js',
        'UIEF/controladdin/Scripts/d3.v3.js',
        'UIEF/controladdin/Scripts/jquery-3.3.1.js',
        'UIEF/controladdin/main.js';
    StyleSheets =
        'UIEF/controladdin/CSS/style.css',
        'UIEF/controladdin/CSS/fabric.min.css',
        'UIEF/controladdin/CSS/fabric.components.min.css';

    StartupScript = 'UIEF/controladdin/startupScript.js';
    RecreateScript = 'UIEF/controladdin/recreateScript.js';
    RefreshScript = 'UIEF/controladdin/refreshScript.js';

    event ControlAddinIsReady()
    event ControlAddinIsStarted()
    event ControlAddinIsRefreshed()
    event ControlAddinIsRecreated()
    event ControlAddinIsBusy(state: Boolean)
    event OnError(errortext: Text)
    event OnCSS(errortext: Text)
    event OnUIEvent(id: code[50]; data: Text)
    event OnJSEvent(id: code[50]; data1: Text; data2: Text; data3: Text; data4: Text);
    event OnResize();
    event OnHTML(html: text);

    procedure Run(jscode: Text);
    procedure Setmode(mode1: Integer);
    procedure Reset();
    procedure LoadCSS(cssid: Text; css: Text);
    procedure RemoveCSS(cssid: Text);

    procedure CreateAndAppend(newid: Text; addtoid: Text; html: text);

    procedure CreateAndAppendToRoot(newid: Text; html: Text);

    procedure RemoveByID(id: Text);

    procedure SetText(search: Text; value: text);

    procedure SetAttr(search: Text; attrname: text; value: text);

    procedure GetHTML();
}