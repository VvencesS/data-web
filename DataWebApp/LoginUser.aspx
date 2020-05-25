<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="DataWebApp.LoginUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Login cho User</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="fontawesome-free-5.13.0-web/css/fontawesome.css" rel="stylesheet" />
    <link href="fontawesome-free-5.13.0-web/css/all.css" rel="stylesheet" />

    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/Uploadimg.css" rel="stylesheet" />
    <link href="Content/LoginUser.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div>
            <div class="main-body">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col-sm-5">
                            <!-- Login -->
                            <div class="login-user mt-5" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Đăng nhập</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="name" class="col-form-label">Họ và tên</label>
                                                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="birthday" class="col-form-label">Ngày sinh</label>
                                                    <asp:TextBox ID="txtBirthday" runat="server" class="form-control" TextMode="DateTime"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ID" class="col-form-label">CMT</label>
                                                    <asp:TextBox ID="txtCMT" runat="server" class="form-control"></asp:TextBox>
                                                </div>

                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" class="btn btn-primary" OnClick="btnLogin_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/javascript.js"></script>
</body>
</html>
