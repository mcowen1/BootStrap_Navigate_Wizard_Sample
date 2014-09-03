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
            <p class="lead">Navigation Wizard with next and previous buttons - using CSS and jQuery</p>
        </div>
        <div class='row'>
            <h2>Demo 1</h2>
            <div>
                <ul class='nav nav-wizard'>
                    <li id="nav1" class='active'><a href='#step1' data-toggle="tab">Step 1 - Completed</a></li>
                    <li id="nav2"><a href='#step2' data-toggle="tab">Step 2 - Completed</a></li>
                    <li id="nav3"><a href='#step3' data-toggle="tab">Step 3 - Active</a></li>
                    <li id="nav4"><a href='#step4' data-toggle="tab">Step 4 - Active</a></li>
                    <li id="nav5"><a href='#step5' data-toggle="tab">Step 5 - Active</a></li>
                </ul>
                <br />
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade  active in" id="step1">
                        <p>Step 1</p>
                    </div>
                    <div class="tab-pane fade" id="step2">
                        <p>Step 2</p>
                    </div>
                    <div class="tab-pane fade" id="step3">
                        <p>Step 3</p>
                    </div>
                    <div class="tab-pane fade " id="step4">
                        <p>Step 4</p>
                    </div>
                    <div class="tab-pane fade " id="step5">
                        <p>Step 5</p>
                    </div>
                </div>
                <button type="button" id="btnPrev" title="Move Next" class="btn btn-primary">< Previous</button>
                <button type="button" id="btnNext" title="Move Next" class="btn btn-primary">Next ></button>
            </div>
        </div>

    </div>

    <script>
        $(function () {

            $('#btnNext').click(function () {
                $("li.active").next().addClass("active");
                $(".tab-pane.active").next().addClass("active in");
                $("li.active").prev().removeClass("active");
                $(".tab-pane.active").prev().removeClass("active in");
            });

            $('#btnPrev').click(function () {
                $("li.active").prev().addClass("active");
                $(".tab-pane.active").prev().addClass("active in");
                $("li.active").next().removeClass("active");
                $(".tab-pane.active").next().removeClass("active in");
            });
        });

    </script>
    </form>
</body>
</html>
