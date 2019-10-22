let ControlAddInContainer;
let ContentContainer;
let Viewmode = 0;

const GlobalHTMLCenterALign =
    '<div id="bg" class="caAddIn" style="width:100%; height:100%">' +
    '   <div id="centerdiv" class="center"></div>' +
    '</div>';

function RaiseALEvent(eventName, args) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(eventName, args);
}

function RaiseUIEvent(id, eventtext) {
    args = [id, eventtext];
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnUIEvent', args);
}

function RaiseJSEvent(id, data1, data2, data3, data4) {
    args = [id, data1, data2, data3, data4];
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnJSEvent', args);
}

function RaiseOnError(errortext) {
    args = [errortext];
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnError', args);
}
function RaiseOnResize() {
    args = [];
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnResize', args);
}
function RaiseOnHTML(html) {
    args = [html];
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnHTML', args);
}

function InitializeControlAddIn() {
    ControlAddInContainer = $("#controlAddIn");
    RaiseALEvent('ControlAddinIsReady', []);
}

function Run(js) {
    try {
        if (js !== null && js !== '') {
            eval(js);
        }
    } catch (err) {
        if (jQuery.prototype.isPrototypeOf(ContentContainer)) {
            ContentContainer.empty();
            ContentContainer.append('<div class="errormsg">' + err + '</div>');
            RaiseOnError(err + ' ');
        }
    }
}

//
function SetContainer()
{
    ControlAddInContainer.empty();
    switch (Viewmode) {
        case 0:
            ContentContainer = ControlAddInContainer;
            break;
        case 1:
            ControlAddInContainer.append(GlobalHTMLCenterALign);
            ContentContainer = $("#centerdiv");
            break;
    }   
}

function Setmode(mode1) {
    Viewmode = mode1;
    SetContainer();
}

function Reset() {
    SetContainer();
    var list = document.getElementsByTagName('head');
    while (list.firstChild) {
        list.removeChild(list.firstChild);
    }
}

function LoadCSS(cssid, css) {
    try {
        if (css !== null && css !== '') {
            var style = document.createElement('style');
            style.id = cssid;
            style.type = 'text/css';
            style.innerHTML = css;
            //document.body.appendChild(style);
            document.getElementsByTagName('head')[0].appendChild(style);
            UIEFCSSStyles.push(id);
            //var sheet = document.createElement('style')
            //sheet.innerHTML = "div {border: 2px solid black; background-color: blue;}";
            //document.body.appendChild(sheet);
        }
    } catch (err) {
        RaiseALEvent('OnCSS', [err]);
    }
}

function RemoveCSS(cssid) {
    try {
        var sheetToBeRemoved = document.getElementById(cssid);
        var sheetParent = sheetToBeRemoved.parentNode;
        sheetParent.removeChild(sheetToBeRemoved);
    } catch (err) {
        RaiseALEvent('OnCSS', [err]);
    }
}

function CreateAndAppend(newid, addtoid, html) {
    try {
        var $newelement = $(html);
        if (newid !== '') {
            $newelement.attr("id", newid);
        }
        if (addtoid !== '') {
            $('#' + addtoid).append($newelement);
        }
    } catch (err) {
        RaiseOnError('CreateAndAppend() Error: ' + err);
    }
}

function CreateAndAppendToRoot(newid, html) {
    try {
        var $newelement = $(html);
        if (newid !== '') {
            $newelement.attr("id", newid);
        }
        if (jQuery.prototype.isPrototypeOf(ContentContainer)) {
            ContentContainer.append($newelement);
        }
    } catch (err) {
        RaiseOnError('CreateAndAppendToRoot() Error: ' + err);
    }
}

function RemoveByID(id) {
    try {
        if (id !== '') {
            $('#' + id).remove();
        }
    } catch (err) {
        RaiseOnError('RemoveByID() Error: ' + err);
    }
}

function SetText(search, value) {
    try {
        $(search).html(value);
    } catch (err) {
        RaiseOnError('SetText() Error: ' + err);
    }
}

function SetAttr(search, attrname, value) {
    try {
        $(search).attr(attrname, value);
    } catch (err) {
        RaiseOnError('SetAttr() Error: ' + err);
    }
}

function GetHTML()
{
    RaiseOnHTML(ControlAddInContainer.html());
}

$(document).ready(function () {
    InitializeControlAddIn();
});

window.__controlAddInError__NAV = window.__controlAddInError;
window.__controlAddInError = function (e) {
    //console.log("Unhandled error has occurred: '" + e.message + "' - Stack: " + e.stack);
    RaiseALEvent('OnError', [e.message]);
    window.__controlAddInError__NAV(e);
};

window.addEventListener('resize', function (event) {
    RaiseOnResize();
});
