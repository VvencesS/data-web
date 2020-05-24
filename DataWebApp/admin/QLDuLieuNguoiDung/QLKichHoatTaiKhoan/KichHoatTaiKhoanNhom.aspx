<%@ Page Title="Kích hoạt tài khoản theo nhóm" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KichHoatTaiKhoanNhom.aspx.cs" Inherits="DataWebApp.admin.QLDuLieuNguoiDung.QLKichHoatTaiKhoan.KichHoatTaiKhoanNhom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/KichHoatTaiKhoan.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="KichHoatTaiKhoanNhom.aspx"><i class="fas fa-home"></i></a>/ <a href="KichHoatTaiKhoanNhom.aspx">Quản lý tài khoản người dùng</a>
    </div>
    <div class="content-main-body">
        <h5>Danh sách kích hoạt theo nhóm</h5>
        <div class="search-info d-sm-flex justify-content-between">
            <div class="form-group">
                <asp:TextBox ID="txtTimKiem" runat="server" CssClass="form-control font-size-08rem">Tìm kiếm</asp:TextBox>
            </div>
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
            <div class="form-group">
                <asp:DropDownList ID="drpTrangThai" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True">
                    <asp:ListItem Selected="True">--Trạng thái--</asp:ListItem>
                    <asp:ListItem Value="True">--Kích hoạt--</asp:ListItem>
                    <asp:ListItem Value="False">--Từ chối--</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:LinkButton ID="lnkTimKiem" runat="server" CssClass="btn btn-primary font-size-08rem mb-3">Tìm kiếm</asp:LinkButton>
        </div>
        <asp:Repeater ID="rptGroup" runat="server" OnItemCommand="rptGroup_ItemCommand">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <tr>
                        <th>Tên nhóm</th>
                        <th>Loại nhóm</th>
                        <th>Thuộc vào</th>
                        <th>Thao tác</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#:Eval("name_Group") %></td>
                    <td><%#:Eval("level_Group") %></td>
                    <td><%#:Eval("parent_Group") %></td>
                    <td>
                        <asp:LinkButton ID="lnkKichHoat" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_Group") %>' CssClass="p-2 btn btn-primary">
                            <i class="fas fa-eye"></i>
                        </asp:LinkButton>                       
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
    </div>
</asp:Content>
