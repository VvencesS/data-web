<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="DataWebApp.admin.LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="../fontawesome-free-5.13.0-web/css/fontawesome.css" rel="stylesheet" />
    <link href="../fontawesome-free-5.13.0-web/css/all.css" rel="stylesheet" />

    <title>Đăng nhập cho Admin</title>

    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/LoginAdmin.css" rel="stylesheet" />
    <link href="../Content/Uploadimg.css" rel="stylesheet" />
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
                                                    <label for="taikhoan" class="col-form-label">Tài khoản</label>
                                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="matkhau" class="col-form-label">Mật khẩu</label>
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary" OnClick="btnLogin_Click" />
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
</body>
</html>
