<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="NavigationWizardSample._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation Wizard</title>
    <link href="Images/logo48.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-nav-wizard.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse" style="border-radius: 0">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand   nav-menu-image" href="http://www.mcowendesign.com">
                    <img src="Images/logo48.png" alt="" title="A Product of m.cowen design"/></a>
                    <a class="navbar-brand" href="#">Bootstrap Wizard Navigation</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div>
                <h1>Bootstrap Navigation Wizard </h1>
                <p class="lead">Navigation Wizard with next and previous buttons - using CSS and jQuery</p>

              <%--  This is the progress bar - just remove this if it is not required--%>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                        Start
                    </div>
                </div>
              <%--  ************************************************************************--%>

            </div>
            <div class='row'>
                <h2>Demo 1</h2>
                <div>
                    <ul id="Steps" class='nav nav-wizard'>
                        <li id="nav1" class='active'><a href='#step1' data-toggle="tab">Step 1 - Introduction</a></li>
                        <li id="nav2"><a href='#step2' data-toggle="tab">Step 2 - Initial Steps</a></li>
                        <li id="nav3"><a href='#step3' data-toggle="tab">Step 3 - Getting Data</a></li>
                        <li id="nav4"><a href='#step4' data-toggle="tab">Step 4 - Settings</a></li>
                        <li id="nav5"><a href='#step5' data-toggle="tab">Step 5 - End</a></li>
                    </ul>
                    <br />
                    <div id="myTabContent" class="tab-content adbordereddiv">
                        <div class="tab-pane fade  active in" id="step1">
                            <p>Step 1 Introduction</p>
                        </div>
                        <div class="tab-pane fade" id="step2">
                            <p>Step 2 Initial Steps</p>
                        </div>
                        <div class="tab-pane fade" id="step3">
                            <p>Step 3 Getting Data</p>
                        </div>
                        <div class="tab-pane fade " id="step4">
                            <p>Step 4 Settings</p>
                        </div>
                        <div class="tab-pane fade " id="step5">
                            <p>Step 5 End</p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <button type="button" id="btnPrev" title="Move Next" class="btn btn-primary" disabled="disabled">< Previous</button>
                    <button type="button" id="btnNext" title="Move Next" class="btn btn-primary">Next ></button>
                </div>
            </div>

        </div>

        <script>
            $(function () {

                // n = How many steps are there in the wizard
                //Count the li's in the "Steps" List
                var n = $('ul#Steps li').length;
              
                $('ul#Steps li').click(function () {

                    //Index of the slected "li" item
                    var x = $('ul#Steps li').index(this);
    
                    //Disable the "Next" button if the last step is selected
                    // if the selected list item "li" index is equal to the total items n-1
                    // (-1 because the index is 0 based) then we are at the
                    //last item and there are no more "Next" items to select.
                    if (x == (n - 1)) {
                        $('#btnNext').attr('disabled', 'disabled');
                    }
                    else {
                        //Enable the next button if th elast wizard steop is not selected
                        $('#btnNext').removeAttr('disabled');
                    }

                    //Disable the "Previous Button if the first step is selected.
                    //If the selected "li" item index is 0 then the first item
                    //has been selected so diable the "previous" button.
                    if (x == 0) {
                        $('#btnPrev').attr('disabled', 'disabled');
                    }
                    else {
                        $('#btnPrev').removeAttr('disabled');
                    }


                    //Set the progress bar value to the current index value of the active "li"
                    var i = $("li.active").index();
                    nextstep(x)

                });


                $('#btnNext').click(function () {
                    var n = $("li").length;
                    var x = $('.progress-bar').attr('aria-valuenow');
         
                    $("li.active").next().addClass("active");
                    $(".tab-pane.active").next().addClass("active in");
                    $("li.active").prev().removeClass("active");
                    $(".tab-pane.active").prev().removeClass("active in");
                    if ($('#Steps').children('li').last().hasClass('active')) {
                        $('#btnNext').attr('disabled', 'disabled');
                    }
                    $('#btnPrev').removeAttr('disabled');
                  
                    //Set the progress bar value
                    var i = $("li.active").index();
                    nextstep(i);
                });

                $('#btnPrev').click(function () {
                    var n = $("li").length;
                    var x = $('.progress-bar').attr('aria-valuenow');
          
                    $("li.active").prev().addClass("active");
                    $(".tab-pane.active").prev().addClass("active in");
                    $("li.active").next().removeClass("active");
                    $(".tab-pane.active").next().removeClass("active in");
                    if ($("#nav1").hasClass("active")) {
                        $('#btnPrev').attr('disabled', 'disabled');
                    }
                    $('#btnNext').removeAttr('disabled');

                    //Set the progress bar value
                    var i = $("li.active").index();
                    nextstep(i);
                });


                //Set the value of the progress bar when the List is selected.
                function nextstep(x) {
                    var percent = (x * 100 / (n - 1)) + '%'
                    //Set the bar value
                    $('.progress-bar').css('width', percent).attr('aria-valuenow', x);
                    //Place the text inside the progress bar
                    $('.progress-bar').html((x + 1) + " of " + n)

                };
            });

        </script>
    </form>
</body>
</html>
