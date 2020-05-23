<%@ Page Title="Thêm mới" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThemMoi.aspx.cs" Inherits="DataWebApp.admin.QLCauHoi.ThemMoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/CauHoi.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="XemSuaXoa.aspx"><i class="fas fa-home"></i></a>/ <a href="XemSuaXoa.aspx">Quản lý câu hỏi</a>
    </div>
    <div class="content-main-body">
        <h5>Thêm mới câu hỏi</h5>
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdImage" runat="server" />
        <div class="new-question">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <table class="table font-size-08rem">
                            <tbody>
                                <tr>
                                    <td scope="row">Trạng thái <span style="color: red;">*</span>:</td>
                                    <td>
                                        <div class="form-group">
                                            <asp:DropDownList ID="drpTrangThai" runat="server" CssClass="form-control font-size-08rem">
                                                <asp:ListItem Selected="True">--Trạng thái--</asp:ListItem>
                                                <asp:ListItem Value="True">Kích hoạt</asp:ListItem>
                                                <asp:ListItem Value="False">Chờ Duyệt</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Nội dung <span style="color: red;">*</span>:</td>
                                    <td>
                                        <div class="form-group">
                                            <asp:TextBox ID="txaContent" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Bắt buộc <span style="color: red;">*</span>:</td>
                                    <td>
                                        <div class="form-group">
                                            <asp:DropDownList ID="drpBatBuoc" runat="server" CssClass="form-control font-size-08rem">
                                                <asp:ListItem Selected="True">--Bắt buộc--</asp:ListItem>
                                                <asp:ListItem Value="True">Có</asp:ListItem>
                                                <asp:ListItem Value="False">Không</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Ảnh mô tả <span style="color: red;">*</span>:</td>
                                    <td class="d-flex">
                                        <img src='/images/question/<%#:Eval("image_Des") %>' width="100px" class="img-fluid" id="img" />
                                        <asp:FileUpload ID="fUp" runat="server" CssClass="font-size-08rem" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnUpdate" runat="server" Text="Lưu" CssClass="btn btn-warning font-size-08rem px-4" OnClick="btnUpdate_Click"></asp:Button>
                        <asp:Button ID="btnExit" runat="server" Text="Hủy" CssClass="btn btn-primary font-size-08rem px-4" OnClick="btnExit_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
