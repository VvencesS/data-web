<%@ Page Title="Kích hoạt từng tài khoản" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KichHoatTungTaiKhoan.aspx.cs" Inherits="DataWebApp.admin.QLDuLieuNguoiDung.QLKichHoatTaiKhoan.KichHoatTungTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/KichHoatTaiKhoan.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="XemDuLieuNguoiDung.aspx"><i class="fas fa-home"></i></a>/ <a href="XemDuLieuNguoiDung.aspx">Dữ liệu người dùng</a>
    </div>
    <div class="content-main-body">
        <h5>Danh sách sinh viên</h5>
        <div class="search-info d-sm-flex justify-content-start">
            <div class="form-group">
                <asp:TextBox ID="txtTimKiem" runat="server" CssClass="form-control font-size-08rem">Tìm kiếm</asp:TextBox>
            </div>
            <div class="search-info d-sm-flex justify-content-start">
                <div class="form-group">
                    <asp:DropDownList ID="drpChonTruong" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True">
                        <asp:ListItem Value="0">  
                                    --Chọn trường--  
                        </asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="drpChonKhoa" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True">
                        <asp:ListItem Value="0">  
                                    --Chọn khoa--  
                        </asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="drpChonLop" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True">
                        <asp:ListItem Value="0">  
                                    --Chọn lớp--  
                        </asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:LinkButton ID="lnkTimKiem" runat="server" CssClass="btn btn-primary font-size-08rem mb-3">Tìm kiếm</asp:LinkButton>
        </div>
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdIDUser" runat="server" />
        <asp:HiddenField ID="hdIDGroup" runat="server" />
        
        <asp:Repeater ID="rptUser" runat="server" OnItemCommand="rptUser_ItemCommand">
            <HeaderTemplate>
                <table class="table table-bordered font-size-08rem">
                    <tr>
                        <th>Mã sinh viên</th>
                        <th>Tên sinh viên</th>
                        <th>Giới tính</th>
                        <th>CMT</th>
                        <th>Ngày sinh</th>
                        <th>Địa chỉ</th>
                        <th>SDT</th>
                        <th>Email</th>
                        <th>Kích hoạt</th>
                        <th>Thao tác</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#:Eval("student_Code") %></td>
                    <td><%#:Eval("name") %></td>
                    <td><%#:Eval("gener") %></td>
                    <td><%#:Eval("cmt") %></td>
                    <td><%#:Eval("birthday", "{0: dd/MM/yyyy}" )%></td>
                    <td><%#:Eval("address") %></td>
                    <td><%#:Eval("phone") %></td>
                    <td><%#:Eval("email") %></td>
                    <td><%#:Eval("status") %></td>
                    <td>
                        <asp:LinkButton ID="lnkStatus" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_User") %>'>Kích hoạt</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-backward"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-forward"></i></a>
            </li>
        </ul>
</asp:Content>
