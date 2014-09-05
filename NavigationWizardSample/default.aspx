<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="NavigationWizardSample._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-nav-wizard.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="navbar navbar-inverse" style="border-radius:0">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Bootstrap Wizard Navigation</a>   
            </div>
        </div>
    </div>
    <div class="container">
        <div>
            <h1>Bootstrap Wizard Navigation</h1>
            <p class="lead">Navigation Wizard with "NEXT" or "PREVIOUS" buttons CSS and jQuery</p>
        </div>
        <div class='row'>
            <h2>Demo 1</h2>
            <div>
                <ul id="Steps" class='nav nav-wizard'>
                    <li id="nav1" class='active'><a href='#step1' data-toggle="tab">Step 1 - Introduction</a></li>
                    <li id="nav2"><a href='#step2' data-toggle="tab">Step 2 - Initial Steps</a></li>
                    <li id="nav3"><a href='#step3' data-toggle="tab">Step 3 - Getting Data</a></li>
                    <li id="nav4"><a href='#step4' data-toggle="tab">Step 4 - Settings</a></li>
                    <li id="nav5"><a href='#step5' data-toggle="tab">Step 5 - Conclustion</a></li>
                </ul>
                <br />
                <div id="myTabContent" class="tab-content">
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
                        <p>Step 5 Conclustion</p>
                    </div>
                </div>
                <button type="button" id="btnPrev" title="Move Next" class="btn btn-primary" disabled="disabled">< Previous</button>
                <button type="button" id="btnNext" title="Move Next" class="btn btn-primary">Next ></button>
            </div>
        </div>

    </div>

    <script>
        $(function () {
            
             var n = $('ul#Steps li').length;
            $('ul#Steps li').click(function(){
                var x = $('ul#Steps li').index(this);
                if (x == (n - 1)) {
                    $('#btnNext').attr('disabled', 'disabled');

                }
                else {
                    $('#btnNext').removeAttr('disabled');

                }
                if (x == 0) {
                    $('#btnPrev').attr('disabled', 'disabled');

                }
                else {

                    $('#btnPrev').removeAttr('disabled');
                }

            });
           

            $('#btnNext').click(function () {
                var n = $("li").length;
                $("li.active").next().addClass("active");
                $(".tab-pane.active").next().addClass("active in");
                $("li.active").prev().removeClass("active");
                $(".tab-pane.active").prev().removeClass("active in");
                if($('#Steps').children('li').last().hasClass('active'))
                {
                    $('#btnNext').attr('disabled', 'disabled'); 
                }
               $('#btnPrev').removeAttr('disabled');
   
            });

            $('#btnPrev').click(function () {
                $("li.active").prev().addClass("active");
                $(".tab-pane.active").prev().addClass("active in");
                $("li.active").next().removeClass("active");
                $(".tab-pane.active").next().removeClass("active in");
                if ($("#nav1").hasClass("active")) {
                    $('#btnPrev').attr('disabled', 'disabled');
                }
                $('#btnNext').removeAttr('disabled');
                   
            });
        });

    </script>
    </form>
</body>
</html>
