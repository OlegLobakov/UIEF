
codeunit 50002 "UI Examples Library"
{
    trigger OnRun()
    begin
        RestoreDefaultUIElements();
    end;

    procedure RestoreDefaultUIElements()
    begin
        CreateUIGroup('OFFICEUIFABRIC', 'Office UI Fabric JS', true);

        ElementName := 'OUIF-BTN-N';
        CreateUIElement(ElementName, 'Normal Button', 'https://developer.microsoft.com/en-us/fabric-js/components/button/button', 'OFFICEUIFABRIC');
        AddHtml(ElementName, 0, '<button class="ms-Button">', '');
        AddHtml(ElementName, 1, '<span class="ms-Button-label">Normal Button</span>', '');
        AddHtml(ElementName, 0, '</button>', '');
        AddJs(ElementName, 0, 'var ButtonElements = document.querySelectorAll(".ms-Button");');
        AddJs(ElementName, 0, 'for (var i = 0; i < ButtonElements.length; i++) {');
        AddJs(ElementName, 1, 'new fabric[''Button''](ButtonElements[i], function() {');
        AddJs(ElementName, 1, '});');
        AddJs(ElementName, 0, '}');


        CreateUIElement('OUIF-BTN-PR', 'Primary Button', 'https://developer.microsoft.com/en-us/fabric-js/components/button/button', 'OFFICEUIFABRIC');
        AddHtml('OUIF-BTN-PR', 0, '<button class="ms-Button ms-Button--primary">', '');
        AddHtml('OUIF-BTN-PR', 1, '<span class="ms-Button-label">Create Account</span>', '');
        AddHtml('OUIF-BTN-PR', 0, '</button>', '');
        AddJs('OUIF-BTN-PR', 0, 'var ButtonElements = document.querySelectorAll(".ms-Button");');
        AddJs('OUIF-BTN-PR', 0, 'for (var i = 0; i < ButtonElements.length; i++) {');
        AddJs('OUIF-BTN-PR', 1, 'new fabric[''Button''](ButtonElements[i], function() {');
        AddJs('OUIF-BTN-PR', 1, '});');
        AddJs('OUIF-BTN-PR', 0, '}');

        CreateUIElement('OUIF-BTN-H', 'Hero Button', 'https://developer.microsoft.com/en-us/fabric-js/components/button/button', 'OFFICEUIFABRIC');
        AddHtml('OUIF-BTN-H', 0, '<button class="ms-Button ms-Button--hero">', '');
        AddHtml('OUIF-BTN-H', 1, '<span class="ms-Button-icon"><i class="ms-Icon ms-Icon--Add"></i></span>', '');
        AddHtml('OUIF-BTN-H', 1, '<span class="ms-Button-label">Create Account</span>', '');
        AddHtml('OUIF-BTN-H', 0, '</button>', '');
        AddJs('OUIF-BTN-H', 0, 'var ButtonElements = document.querySelectorAll(".ms-Button");');
        AddJs('OUIF-BTN-H', 0, 'for (var i = 0; i < ButtonElements.length; i++) {');
        AddJs('OUIF-BTN-H', 1, 'new fabric[''Button''](ButtonElements[i], function() {');
        AddJs('OUIF-BTN-H', 2, 'RaiseUIEvent($(this).attr(''id''),''click'');');
        AddJs('OUIF-BTN-H', 1, '});');
        AddJs('OUIF-BTN-H', 0, '}');

        CreateUIElement('OUIF-BTN-C', 'Compound Button', 'https://developer.microsoft.com/en-us/fabric-js/components/button/button', 'OFFICEUIFABRIC');
        AddHtml('OUIF-BTN-C', 0, '<button class="ms-Button ms-Button--compound" id="btnx">', '');
        AddHtml('OUIF-BTN-C', 1, '<span class="ms-Button-icon"><i class="ms-Icon ms-Icon--plus"></i></span>', '');
        AddHtml('OUIF-BTN-C', 1, '<span class="ms-Button-label">Create Account</span>', '');
        AddHtml('OUIF-BTN-C', 1, '<span class="ms-Button-description">Description of this action this button takes</span>', '');
        AddHtml('OUIF-BTN-C', 0, '</button>', '');
        AddJs('OUIF-BTN-C', 0, '$(".ms-Button").click(function(x){');
        AddJs('OUIF-BTN-C', 1, 'RaiseUIEvent($(this).attr(''id''),''click'');');
        AddJs('OUIF-BTN-C', 0, '});');

        CreateUIElement('OUIF-BTN-S', 'Small Button', 'https://developer.microsoft.com/en-us/fabric-js/components/button/button', 'OFFICEUIFABRIC');
        AddHtml('OUIF-BTN-S', 0, '<button class="ms-Button ms-Button--small">', '');
        AddHtml('OUIF-BTN-S', 1, '<span class="ms-Button-label">Create</span>', '');
        AddHtml('OUIF-BTN-S', 0, '</button>', '');
        AddJs('OUIF-BTN-S', 0, 'var ButtonElements = document.querySelectorAll(".ms-Button");');
        AddJs('OUIF-BTN-S', 0, 'for (var i = 0; i < ButtonElements.length; i++) {');
        AddJs('OUIF-BTN-S', 1, 'new fabric[''Button''](ButtonElements[i], function() {');
        AddJs('OUIF-BTN-S', 2, 'RaiseUIEvent($(this).attr(''id''),''click'');');
        AddJs('OUIF-BTN-S', 1, '});');
        AddJs('OUIF-BTN-S', 0, '}');

        CreateUIElement('OUIF-CHK-B', 'Default CheckBox', 'https://developer.microsoft.com/en-us/fabric-js/components/checkbox/checkbox', 'OFFICEUIFABRIC');
        AddHtml('OUIF-CHK-B', 0, '<div class="ms-CheckBox">', '');
        AddHtml('OUIF-CHK-B', 1, '<input tabindex="-1" type="checkbox" class="ms-CheckBox-input">', '');
        AddHtml('OUIF-CHK-B', 1, '<label role="checkbox" class="ms-CheckBox-field" tabindex="0" aria-checked="false" name="checkboxa">', '');
        AddHtml('OUIF-CHK-B', 2, '<span class="ms-Label">Checkbox</span>', '');
        AddHtml('OUIF-CHK-B', 1, '</label>', '');
        AddHtml('OUIF-CHK-B', 0, '</div>', '');
        AddJs('OUIF-CHK-B', 0, 'var CheckBoxElements = document.querySelectorAll(".ms-CheckBox");');
        AddJs('OUIF-CHK-B', 0, 'for (var i = 0; i < CheckBoxElements.length; i++) {');
        AddJs('OUIF-CHK-B', 1, 'new fabric[''CheckBox''](CheckBoxElements[i]);');
        AddJs('OUIF-CHK-B', 2, 'RaiseUIEvent($(this).attr(''id''),''click'');');
        AddJs('OUIF-CHK-B', 0, '}');

        CreateUIElement('OUIF-CFG', 'Choice Field Group', 'https://developer.microsoft.com/en-us/fabric-js/components/choicefieldgroup/choicefieldgroup', 'OFFICEUIFABRIC');
        AddHtml('OUIF-CFG', 0, '<div class="ms-ChoiceFieldGroup" id="choicefieldgroup" role="radiogroup">', '');
        AddHtml('OUIF-CFG', 1, '<div class="ms-ChoiceFieldGroup-title">', '');
        AddHtml('OUIF-CFG', 2, '<label class="ms-Label is-required">Unselected</label>', '');
        AddHtml('OUIF-CFG', 1, '</div>', '');
        AddHtml('OUIF-CFG', 1, '<ul class="ms-ChoiceFieldGroup-list">', '');
        AddHtml('OUIF-CFG', 2, '<li class="ms-RadioButton">', '');
        AddHtml('OUIF-CFG', 3, '<input tabindex="-1" type="radio" class="ms-RadioButton-input">', '');
        AddHtml('OUIF-CFG', 3, '<label role="radio" class="ms-RadioButton-field" tabindex="0" aria-checked="false" name="choicefieldgroup">', '');
        AddHtml('OUIF-CFG', 4, '<span class="ms-Label">Option 1</span>', '');
        AddHtml('OUIF-CFG', 3, '</label>', '');
        AddHtml('OUIF-CFG', 2, '</li>', '');
        AddHtml('OUIF-CFG', 2, '<li class="ms-RadioButton">', '');
        AddHtml('OUIF-CFG', 3, '<input tabindex="-1" type="radio" class="ms-RadioButton-input">', '');
        AddHtml('OUIF-CFG', 3, '<label role="radio" class="ms-RadioButton-field" tabindex="0" aria-checked="false" name="choicefieldgroup">', '');
        AddHtml('OUIF-CFG', 4, '<span class="ms-Label">Option 2</span>', '');
        AddHtml('OUIF-CFG', 3, '</label>', '');
        AddHtml('OUIF-CFG', 2, '</li>', '');
        AddHtml('OUIF-CFG', 2, '<li class="ms-RadioButton">', '');
        AddHtml('OUIF-CFG', 3, '<input tabindex="-1" type="radio" class="ms-RadioButton-input">', '');
        AddHtml('OUIF-CFG', 3, '<label role="radio" class="ms-RadioButton-field is-disabled" tabindex="0" aria-checked="false" name="choicefieldgroup" aria-disabled="true">', '');
        AddHtml('OUIF-CFG', 4, '<span class="ms-Label">Option 3</span>', '');
        AddHtml('OUIF-CFG', 3, '</label>', '');
        AddHtml('OUIF-CFG', 2, '</li>', '');
        AddHtml('OUIF-CFG', 2, '<li class="ms-RadioButton">', '');
        AddHtml('OUIF-CFG', 3, '<input tabindex="-1" type="radio" class="ms-RadioButton-input">', '');
        AddHtml('OUIF-CFG', 3, '<label role="radio" class="ms-RadioButton-field" tabindex="0" aria-checked="false" name="choicefieldgroup">', '');
        AddHtml('OUIF-CFG', 4, '<span class="ms-Label">Option 4</span>', '');
        AddHtml('OUIF-CFG', 3, '</label>', '');
        AddHtml('OUIF-CFG', 2, '</li>', '');
        AddHtml('OUIF-CFG', 1, '</ul>', '');
        AddHtml('OUIF-CFG', 0, '</div>', '');

        AddJs('OUIF-CFG', 0, 'var ChoiceFieldGroupElements = document.querySelectorAll(".ms-ChoiceFieldGroup");');
        AddJs('OUIF-CFG', 0, 'for (var i = 0; i < ChoiceFieldGroupElements.length; i++) {');
        AddJs('OUIF-CFG', 1, 'new fabric[''ChoiceFieldGroup''](ChoiceFieldGroupElements[i]);');
        AddJs('OUIF-CFG', 0, '}');

        //Label
        CreateUIElement('OUIF-LBL', 'Default Label', 'https://developer.microsoft.com/en-us/fabric-js/components/label/label', 'OFFICEUIFABRIC');
        AddHtml('OUIF-LBL', 0, '<label class="ms-Label">Name</label>', '');

        CreateUIElement('OUIF-LBL-D', 'Disabled Label', 'https://developer.microsoft.com/en-us/fabric-js/components/label/label', 'OFFICEUIFABRIC');
        AddHtml('OUIF-LBL-D', 0, '<label class="ms-Label is-disabled">Disabled Label</label>', '');

        CreateUIElement('OUIF-LBL-R', 'Required Label', 'https://developer.microsoft.com/en-us/fabric-js/components/label/label', 'OFFICEUIFABRIC');
        AddHtml('OUIF-LBL-R', 0, '<label class="ms-Label is-required">Required Label</label>', '');

        //TextField
        CreateUIElement('OUIF-TXT', 'Default TextField', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TXT', 0, '<div class="ms-TextField">', '');
        AddHtml('OUIF-TXT', 1, '<label class="ms-Label">Name</label>', '');
        AddHtml('OUIF-TXT', 1, '<input class="ms-TextField-field" type="text" value="" placeholder="">', '');
        AddHtml('OUIF-TXT', 0, '</div>', '');
        AddJs('OUIF-TXT', 0, 'var TextFieldElements = document.querySelectorAll(".ms-TextField");');
        AddJs('OUIF-TXT', 0, 'for (var i = 0; i < TextFieldElements.length; i++) {');
        AddJs('OUIF-TXT', 1, 'new fabric[''TextField''](TextFieldElements[i]);');
        AddJs('OUIF-TXT', 0, '}');

        CreateUIElement('OUIF-TXT-UDL', 'Underlined TextField', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TXT-UDL', 0, '<div class="ms-TextField ms-TextField--underlined">', '');
        AddHtml('OUIF-TXT-UDL', 1, '<label class="ms-Label">Name</label>', '');
        AddHtml('OUIF-TXT-UDL', 1, '<input class="ms-TextField-field" type="text" value="" placeholder="">', '');
        AddHtml('OUIF-TXT-UDL', 0, '</div>', '');
        AddJs('OUIF-TXT-UDL', 0, 'var TextFieldElements = document.querySelectorAll(".ms-TextField");');
        AddJs('OUIF-TXT-UDL', 0, 'for (var i = 0; i < TextFieldElements.length; i++) {');
        AddJs('OUIF-TXT-UDL', 1, 'new fabric[''TextField''](TextFieldElements[i]);');
        AddJs('OUIF-TXT-UDL', 2, 'RaiseUIEvent($(this).attr(''id''),''click'');');
        AddJs('OUIF-TXT-UDL', 0, '}');

        CreateUIElement('OUIF-TXT-PH', 'Placeholder TextField', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TXT-PH', 0, '<div class="ms-TextField ms-TextField--placeholder">', '');
        AddHtml('OUIF-TXT-PH', 1, '<label class="ms-Label">Given name</label>', '');
        AddHtml('OUIF-TXT-PH', 1, '<input class="ms-TextField-field" type="text" value="" placeholder="">', '');
        AddHtml('OUIF-TXT-PH', 0, '</div>', '');
        AddJs('OUIF-TXT-PH', 0, 'var TextFieldElements = document.querySelectorAll(".ms-TextField");');
        AddJs('OUIF-TXT-PH', 0, 'for (var i = 0; i < TextFieldElements.length; i++) {');
        AddJs('OUIF-TXT-PH', 1, 'new fabric[''TextField''](TextFieldElements[i]);');
        AddJs('OUIF-TXT-PH', 0, '}');

        CreateUIElement('OUIF-TXT-ML', 'Multiline TextField', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TXT-ML', 0, '<div class="ms-TextField ms-TextField--multiline">', '');
        AddHtml('OUIF-TXT-ML', 1, '<label class="ms-Label">Name</label>', '');
        AddHtml('OUIF-TXT-ML', 1, '<textarea class="ms-TextField-field"></textarea>', '');
        AddHtml('OUIF-TXT-ML', 0, '</div>', '');
        AddJs('OUIF-TXT-ML', 0, 'var TextFieldElements = document.querySelectorAll(".ms-TextField");');
        AddJs('OUIF-TXT-ML', 0, 'for (var i = 0; i < TextFieldElements.length; i++) {');
        AddJs('OUIF-TXT-ML', 1, 'new fabric[''TextField''](TextFieldElements[i]);');
        AddJs('OUIF-TXT-ML', 0, '}');

        //Toggle
        CreateUIElement('OUIF-TGL-D', 'Default Toggle', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TGL-D', 0, '<div class="ms-Toggle">', '');
        AddHtml('OUIF-TGL-D', 1, '<span class="ms-Toggle-description">Let apps use my location</span>', '');
        AddHtml('OUIF-TGL-D', 1, '<input type="checkbox" id="demo-toggle-3" class="ms-Toggle-input" />', '');
        AddHtml('OUIF-TGL-D', 1, '<label for="demo-toggle-3" class="ms-Toggle-field" tabindex="0">', '');
        AddHtml('OUIF-TGL-D', 2, '<span class="ms-Label ms-Label--off">Off</span>', '');
        AddHtml('OUIF-TGL-D', 2, '<span class="ms-Label ms-Label--on">On</span>', '');
        AddHtml('OUIF-TGL-D', 1, '</label>', '');
        AddHtml('OUIF-TGL-D', 0, '</div>', '');
        AddJs('OUIF-TGL-D', 0, 'var ToggleElements = document.querySelectorAll(".ms-Toggle");');
        AddJs('OUIF-TGL-D', 0, 'for (var i = 0; i < ToggleElements.length; i++) {');
        AddJs('OUIF-TGL-D', 0, '   new fabric[''Toggle''](ToggleElements[i]);');
        AddJs('OUIF-TGL-D', 0, '}');

        CreateUIElement('OUIF-TGL-LT', 'Text Left Toggle', 'https://developer.microsoft.com/en-us/fabric-js/components/textfield/textfield', 'OFFICEUIFABRIC');
        AddHtml('OUIF-TGL-LT', 0, '<div class="ms-Toggle ms-Toggle--textLeft">', '');
        AddHtml('OUIF-TGL-LT', 1, '<span class="ms-Toggle-description">Let apps use my location</span>', '');
        AddHtml('OUIF-TGL-LT', 1, '<input type="checkbox" id="demo-toggle-1" class="ms-Toggle-input" />', '');
        AddHtml('OUIF-TGL-LT', 1, '<label for="demo-toggle-1" class="ms-Toggle-field" tabindex="0">', '');
        AddHtml('OUIF-TGL-LT', 2, '<span class="ms-Label ms-Label--off">Off</span>', '');
        AddHtml('OUIF-TGL-LT', 2, '<span class="ms-Label ms-Label--on">On</span>', '');
        AddHtml('OUIF-TGL-LT', 1, '</label>', '');
        AddHtml('OUIF-TGL-LT', 0, '</div>', '');
        AddJs('OUIF-TGL-LT', 0, 'var ToggleElements = document.querySelectorAll(".ms-Toggle");');
        AddJs('OUIF-TGL-LT', 0, 'for (var i = 0; i < ToggleElements.length; i++) {');
        AddJs('OUIF-TGL-LT', 1, 'new fabric[''Toggle''](ToggleElements[i]);');
        AddJs('OUIF-TGL-LT', 0, '}');

        //spinner
        CreateUIElement('OUIF-SPR', 'Large Spinner', 'https://developer.microsoft.com/en-us/fabric-js/components/spinner/spinner', 'OFFICEUIFABRIC');
        AddHtml('OUIF-SPR', 0, '<div class="ms-Spinner ms-Spinner--large">', '');
        ;
        AddHtml('OUIF-SPR', 0, '</div>', '');
        AddJs('OUIF-SPR', 0, 'var SpinnerElements = document.querySelectorAll(".ms-Spinner");');
        AddJs('OUIF-SPR', 0, 'for (var i = 0; i < SpinnerElements.length; i++) {');
        AddJs('OUIF-SPR', 1, 'new fabric[''Spinner''](SpinnerElements[i]);');
        AddJs('OUIF-SPR', 0, '}');

        CreateUIElement('OUIF-SPR-LBL', 'Large Spinner with Label', 'https://developer.microsoft.com/en-us/fabric-js/components/spinner/spinner', 'OFFICEUIFABRIC');
        AddHtml('OUIF-SPR-LBL', 0, '<div class="ms-Spinner ms-Spinner--large">', '');
        AddHtml('OUIF-SPR-LBL', 1, '<div class="ms-Spinner-label">Loading...</div>', '');
        AddHtml('OUIF-SPR-LBL', 0, '</div>', '');
        AddJs('OUIF-SPR-LBL', 0, 'var SpinnerElements = document.querySelectorAll(".ms-Spinner");');
        AddJs('OUIF-SPR-LBL', 0, 'for (var i = 0; i < SpinnerElements.length; i++) {');
        AddJs('OUIF-SPR-LBL', 1, 'new fabric[''Spinner''](SpinnerElements[i]);');
        AddJs('OUIF-SPR-LBL', 0, '}');

        //datepicker
        CreateUIElement('OUIF-DP', 'Default DatePicker', 'https://developer.microsoft.com/en-us/fabric-js/components/datepicker/datepicker', 'OFFICEUIFABRIC');
        AddHtml('OUIF-DP', 0, '<div class="ms-DatePicker">', '');
        AddHtml('OUIF-DP', 1, '<div class="ms-TextField">', '');
        AddHtml('OUIF-DP', 2, '<label class="ms-Label">Start date</label>', '');
        AddHtml('OUIF-DP', 2, '<i class="ms-DatePicker-event ms-Icon ms-Icon--Event"></i>', '');
        AddHtml('OUIF-DP', 2, '<input class="ms-TextField-field" type="text" placeholder="Select a date&hellip;">', '');
        AddHtml('OUIF-DP', 1, '</div>', '');
        AddHtml('OUIF-DP', 1, '<div class="ms-DatePicker-monthComponents">', '');
        AddHtml('OUIF-DP', 2, '<span class="ms-DatePicker-nextMonth js-nextMonth"><i class="ms-Icon ms-Icon--ChevronRight"></i></span> ', '');
        AddHtml('OUIF-DP', 2, '<span class="ms-DatePicker-prevMonth js-prevMonth"><i class="ms-Icon ms-Icon--ChevronLeft"></i></span> ', '');
        AddHtml('OUIF-DP', 2, '<div class="ms-DatePicker-headerToggleView js-showMonthPicker"></div>', '');
        AddHtml('OUIF-DP', 1, '</div>', '');
        AddHtml('OUIF-DP', 1, '<span class="ms-DatePicker-goToday js-goToday">Go to today</span> ', '');
        AddHtml('OUIF-DP', 1, '<div class="ms-DatePicker-monthPicker">', '');
        AddHtml('OUIF-DP', 3, '<div class="ms-DatePicker-header">', '');
        AddHtml('OUIF-DP', 3, '<div class="ms-DatePicker-yearComponents">', '');
        AddHtml('OUIF-DP', 4, '<span class="ms-DatePicker-nextYear js-nextYear"><i class="ms-Icon ms-Icon--ChevronRight"></i></span> ', '');
        AddHtml('OUIF-DP', 4, '<span class="ms-DatePicker-prevYear js-prevYear"><i class="ms-Icon ms-Icon--ChevronLeft"></i></span> ', '');
        AddHtml('OUIF-DP', 3, '</div>', '');
        AddHtml('OUIF-DP', 3, '<div class="ms-DatePicker-currentYear js-showYearPicker"></div>', '');
        AddHtml('OUIF-DP', 2, '</div>', '');
        AddHtml('OUIF-DP', 2, '<div class="ms-DatePicker-optionGrid">', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="0">Jan</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="1">Feb</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="2">Mar</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="3">Apr</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="4">May</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="5">Jun</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="6">Jul</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="7">Aug</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="8">Sep</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="9">Oct</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="10">Nov</span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-monthOption js-changeDate" data-month="11">Dec</span>', '');
        AddHtml('OUIF-DP', 2, '</div>', '');
        AddHtml('OUIF-DP', 1, '</div>', '');
        AddHtml('OUIF-DP', 1, '<div class="ms-DatePicker-yearPicker">', '');
        AddHtml('OUIF-DP', 2, '<div class="ms-DatePicker-decadeComponents">', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-nextDecade js-nextDecade"><i class="ms-Icon ms-Icon--ChevronRight"></i></span>', '');
        AddHtml('OUIF-DP', 3, '<span class="ms-DatePicker-prevDecade js-prevDecade"><i class="ms-Icon ms-Icon--ChevronLeft"></i></span>', '');
        AddHtml('OUIF-DP', 2, '</div>', '');
        AddHtml('OUIF-DP', 1, '</div>', '');
        AddHtml('OUIF-DP', 0, '</div>', '');

        AddJs('OUIF-DP', 0, 'var DatePickerElements = document.querySelectorAll(".ms-DatePicker");');
        AddJs('OUIF-DP', 0, 'for (var i = 0; i < DatePickerElements.length; i++) {');
        AddJs('OUIF-DP', 1, '    new fabric[''DatePicker''](DatePickerElements[i]);');
        AddJs('OUIF-DP', 0, '}');


        CreateUIElement('OUIF-DD', 'Default Dropdown', 'https://developer.microsoft.com/en-us/fabric-js/components/dropdown/dropdown', 'OFFICEUIFABRIC');
        AddHtml('OUIF-DD', 0, '<div class="ms-Dropdown" tabindex="0">', '');
        AddHtml('OUIF-DD', 1, '<label class="ms-Label">Dropdown label</label>', '');
        AddHtml('OUIF-DD', 1, '<i class="ms-Dropdown-caretDown ms-Icon ms-Icon--ChevronDown"></i>', '');
        AddHtml('OUIF-DD', 1, '<select class="ms-Dropdown-select">', '');
        AddHtml('OUIF-DD', 2, '<option>Choose a sound&amp;hellip;</option>', '');
        AddHtml('OUIF-DD', 2, '<option>Dog barking</option>', '');
        AddHtml('OUIF-DD', 2, '<option>Wind blowing</option>', '');
        AddHtml('OUIF-DD', 2, '<option>Duck quacking</option', '');
        AddHtml('OUIF-DD', 2, '<option>Cow mooing</option>', '');
        AddHtml('OUIF-DD', 1, '</select>', '');
        AddHtml('OUIF-DD', 0, '</div>', '');
        AddJs('OUIF-DD', 0, 'var DropdownHTMLElements = document.querySelectorAll(''.ms-Dropdown'');');
        AddJs('OUIF-DD', 0, 'for (var i = 0; i < DropdownHTMLElements.length; ++i) {');
        AddJs('OUIF-DD', 1, '    var Dropdown = new fabric[''Dropdown''](DropdownHTMLElements[i]);');
        AddJs('OUIF-DD', 0, '}');

        CreateUIElement('OUIF-D-T', 'Default Table', 'https://developer.microsoft.com/en-us/fabric-js/components/table/table', 'OFFICEUIFABRIC');
        AddHtml('OUIF-D-T', 0, '<table class="ms-Table">', '');
        AddHtml('OUIF-D-T', 1, '<thead>', '');
        AddHtml('OUIF-D-T', 2, '<tr>', '');
        AddHtml('OUIF-D-T', 3, '<th>Location</th>', '');
        AddHtml('OUIF-D-T', 3, '<th>Modified</th>', '');
        AddHtml('OUIF-D-T', 3, '<th>Type</th>', '');
        AddHtml('OUIF-D-T', 3, '<th>File Name</th>', '');
        AddHtml('OUIF-D-T', 2, '</tr>', '');
        AddHtml('OUIF-D-T', 1, '</thead>', '');
        AddHtml('OUIF-D-T', 1, '<tbody>', '');
        AddHtml('OUIF-D-T', 2, '<tr>', '');
        AddHtml('OUIF-D-T', 3, '<td>Location</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Modified</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Type</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>File Name</td>', '');
        AddHtml('OUIF-D-T', 2, '</tr>', '');
        AddHtml('OUIF-D-T', 2, '<tr>', '');
        AddHtml('OUIF-D-T', 3, '<td>Location</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Modified</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Type</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>File Name</td>', '');
        AddHtml('OUIF-D-T', 2, '</tr>', '');
        AddHtml('OUIF-D-T', 2, '<tr>', '');
        AddHtml('OUIF-D-T', 3, '<td>Location</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Modified</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Type</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>File Name</td>', '');
        AddHtml('OUIF-D-T', 2, '</tr>', '');
        AddHtml('OUIF-D-T', 2, '<tr>', '');
        AddHtml('OUIF-D-T', 3, '<td>Location</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Modified</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>Type</td>', '');
        AddHtml('OUIF-D-T', 3, '<td>File Name</td>', '');
        AddHtml('OUIF-D-T', 2, '</tr>', '');
        AddHtml('OUIF-D-T', 1, '</tbody>', '');
        AddHtml('OUIF-D-T', 0, '</table>', '');
        AddJs('OUIF-D-T', 0, 'var TableElements = document.querySelectorAll(".ms-Table");');
        AddJs('OUIF-D-T', 0, 'for (var i = 0; i < TableElements.length; i++) {');
        AddJs('OUIF-D-T', 1, 'new fabric[''Table''](TableElements[i]);');
        AddJs('OUIF-D-T', 0, '}');

        CreateUIGroup('HTML', 'HTML', true);

        ElementName := 'HTML-HEADER';
        CreateUIElement(ElementName, 'Header', '', 'HTML');
        AddHtml(ElementName, 0, '<div style="width=100%; height=100%; display:flex; flex-direction: row; background-color: lightblue">', '');
        AddHtml(ElementName, 0, '', 'CONTENT');
        AddHtml(ElementName, 0, '</div>', '');


        ElementName := 'HTML-BODY';
        CreateUIElement(ElementName, 'Body', '', 'HTML');
        AddHtml(ElementName, 0, '<div width="100%" height="100%">', '');
        AddHtml(ElementName, 0, '', 'CONTENT');
        AddHtml(ElementName, 0, '</div>', '');

        ElementName := 'HTML-FOOTER';
        CreateUIElement(ElementName, 'Footer', '', 'HTML');
        AddHtml(ElementName, 0, '<div width="100%" height="100%">', '');
        AddHtml(ElementName, 0, '', 'CONTENT');
        AddHtml(ElementName, 0, '</div>', '');

        ElementName := 'HTML-TR';
        CreateUIElement(ElementName, 'TableRow', '', 'HTML');
        AddHtml(ElementName, 0, '<tr>', '');
        AddHtml(ElementName, 1, '<td>Location</td>', '');
        AddHtml(ElementName, 1, '<td>Modified</td>', '');
        AddHtml(ElementName, 1, '<td>Type</td>', '');
        AddHtml(ElementName, 1, '<td>File</td>', '');
        AddHtml(ElementName, 0, '</tr>', '');

        ElementName := 'HTML-RB';
        CreateUIElement(ElementName, 'RadioButton', '', 'HTML');
        AddHtml(ElementName, 0, '<li class="ms-RadioButton">', '');
        AddHtml(ElementName, 1, '<input tabindex="-1" type="radio" class="ms-RadioButton-input">', '');
        AddHtml(ElementName, 1, '<label role="radio" class="ms-RadioButton-field" tabindex="0" aria-checked="false" name="choicefieldgroup">', '');
        AddHtml(ElementName, 2, '<span class="ms-Label">Option 4</span>', '');
        AddHtml(ElementName, 1, '</label>', '');
        AddHtml(ElementName, 0, '</li>', '');

        CreateUIGroup('TEST', 'Test UI', true);

        ElementName := 'TEST-DT';
        CreateUIElement(ElementName, 'Table', '', 'TEST');
        AddHtml(ElementName, 0, '<table class="ms-Table">', '');
        AddHtml(ElementName, 1, '<thead>', '');
        AddHtml(ElementName, 1, '', 'HEADER');
        AddHtml(ElementName, 1, '</thead>', '');
        AddHtml(ElementName, 1, '<tbody>', '');
        AddHtml(ElementName, 1, '', 'BODY');
        AddHtml(ElementName, 1, '</tbody>', '');
        AddHtml(ElementName, 0, '</table>', '');

        AddJs('OUIF-D-T', 0, 'var TableElements = document.querySelectorAll(".ms-Table");');
        AddJs('OUIF-D-T', 0, 'for (var i = 0; i < TableElements.length; i++) {');
        AddJs('OUIF-D-T', 1, 'new fabric[''Table''](TableElements[i]);');
        AddJs('OUIF-D-T', 0, '}');

        ElementName := 'TEST-DT-R';
        CreateUIElement(ElementName, 'Table Header', '', 'TEST');
        AddHtml(ElementName, 0, '<tr>', '');
        AddHtml(ElementName, 1, '<th>%1</th>', 'LOCATION');
        AddHtml(ElementName, 1, '<th>Modified</th>', '');
        AddHtml(ElementName, 1, '<th>Type</th>', '');
        AddHtml(ElementName, 1, '<th>File Name</th>', '');
        AddHtml(ElementName, 0, '</tr>', '');

        ElementName := 'TEST-DT-ROW';
        CreateUIElement(ElementName, 'Table Row', '', 'TEST');
        AddHtml(ElementName, 0, '<tr>', '');
        AddHtml(ElementName, 1, '<td>%1</td>', 'LOCATION');
        AddHtml(ElementName, 1, '<td>%1</td>', 'MODIFIED');
        AddHtml(ElementName, 1, '<td>%1</td>', 'TYPE');
        AddHtml(ElementName, 1, '<td>%1</td>', 'FILE');
        AddHtml(ElementName, 0, '</tr>', '');

        CreateUIGroup('FAE', 'Visual Finance Extension', true);
        ElementName := 'AA-CORR';
        CreateUIElement(ElementName, 'Correspondence', '', 'FAE');
        AddHtml(ElementName, 0, '<div id="chart"></div>', '');
        AddHtml(ElementName, 0, '<div id="tooltip" class="hidden">', '');
        AddHtml(ElementName, 1, '<p>', '');
        AddHtml(ElementName, 1, '<span id="value">', '');
        AddHtml(ElementName, 1, '</p>', '');
        AddHtml(ElementName, 0, '</div>', '');

        AddJs(ElementName, 0, '');
        AddJs(ElementName, 0, '');
        AddJs(ElementName, 1, '');
        AddJs(ElementName, 0, '');
    end;

    local procedure AddHtml(Code: Code[20]; Indentation: Integer; Html: Text; PlaceID: Code[20])
    var
        UIElementHTML: Record "UI Element HTML";
    begin
        LineNo := 10000;
        UIElementHTML.INIT();
        UIElementHTML.SETRANGE("UI Element Code", Code);
        IF UIElementHTML.FINDLAST() THEN
            LineNo := UIElementHTML."Line No." + 10000;
        UIElementHTML.INIT();
        UIElementHTML."UI Element Code" := Code;
        UIElementHTML."Line No." := LineNo;
        UIElementHTML.HTML := COPYSTR(Html, 1, 250);
        UIElementHTML."Debug Value" := PlaceID;
        UIElementHTML.Indentation := Indentation;
        UIElementHTML.INSERT(TRUE);
    end;

    local procedure AddJS(code: Code[20]; Indentation: Integer; Javascript: Text)
    var
        UIElementJS: Record "UI Element JS";
    begin
        LineNo := 10000;
        UIElementJS.INIT();
        UIElementJS.SETRANGE("UI Element Code", code);
        IF UIElementJS.FINDLAST() THEN
            LineNo := UIElementJS."Line No." + 10000;
        UIElementJS.INIT();
        UIElementJS."UI Element Code" := code;
        UIElementJS."Line No." := LineNo;
        UIElementJS.Javascript := COPYSTR(Javascript, 1, 250);
        UIElementJS.Indentation := Indentation;
        UIElementJS.INSERT(TRUE);
    end;

    local procedure CreateUIGroup(code: Code[20]; description: Text; uiframework: Boolean)
    var
        UIGroup: record "UI Group";
    begin
        UIGroup.RESET();
        UIGroup.INIT();
        UIGroup.Code := code;
        UIGroup.Description := CopyStr(description, 1, 250);
        UIGroup."UIE Framework" := uiframework;
        IF NOT UIGroup.INSERT() THEN
            UIGroup.MODIFY(TRUE);
    end;

    local procedure CreateUIElement(Code: Code[20]; Description: Text; Url: Text; Group: Code[20])
    var
        UIElement: Record "UI Element";
    begin
        IF UIElement.Get(Code) then
            UIElement.Delete(true);
        UIElement.INIT();
        UIElement.Code := Code;
        UIElement.Description := CopyStr(Description, 1, 250);
        UIElement.URL := CopyStr(Url, 1, 250);
        UIElement.VALIDATE(Group, Group);
        UIElement.INSERT(TRUE);
    end;

    var
        ElementName: Code[20];
        LineNo: Integer;
}