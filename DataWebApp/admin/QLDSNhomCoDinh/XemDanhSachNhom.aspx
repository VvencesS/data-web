<%@ Page Title="Quản lý nhóm cố định" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="XemDanhSachNhom.aspx.cs" Inherits="DataWebApp.admin.QLDSNhomCoDinh.XemDanhSachNhom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/DSNhom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="XemDanhSachNhom.aspx"><i class="fas fa-home"></i></a>/ <a href="XemDanhSachNhom.aspx">Quản lý nhóm cố định</a>
    </div>
    <div class="content-main-body">
        <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
            <asp:View ID="v0" runat="server">
                <h5>Danh sách nhóm</h5>
                <div class="search-info d-sm-flex justify-content-start">

                    <div class="form-group">
                        <asp:DropDownList ID="drpChonTruong" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True" OnSelectedIndexChanged="drpChonTruong_SelectedIndexChanged">
                            <asp:ListItem Value="0">  
                                --Chọn trường--  
                            </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="drpChonKhoa1" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True" OnSelectedIndexChanged="drpChonKhoa1_SelectedIndexChanged">
                            <asp:ListItem Value="0">  
                                --Chọn khoa--  
                            </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:HiddenField ID="hdInsert" runat="server" />
                <asp:HiddenField ID="hdIDGroup" runat="server" />
                <div class="save-export d-sm-flex justify-content-end">
                    <div style="width: 205rem"></div>
                    <asp:DropDownList ID="drpLevelGroup" runat="server" CssClass="form-control font-size-08rem mr-3">
                        <asp:ListItem Selected="True" Value="">--Chọn loại--</asp:ListItem>
                        <asp:ListItem Value="khoa">Khoa</asp:ListItem>
                        <asp:ListItem Value="lop">Lớp</asp:ListItem>
                    </asp:DropDownList>
                    <asp:LinkButton ID="lnkUpdate" runat="server" CssClass="btn btn-primary font-size-08rem mb-2" OnClick="lnkUpdate_Click">Thêm mới</asp:LinkButton>
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
                                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_Group") %>'>Cập nhật</asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%#:Eval("id_Group") %>' OnLoad="msgDelete">Xóa</asp:LinkButton>
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
            </asp:View>
            <asp:View ID="v1" runat="server">
                <h5>Thêm mới khoa</h5>
                <table class="table mt-5">
                    <tr>
                        <td scope="row">Trường</td>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="drpChonTruong1" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td scope="row">Tên khoa</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtTenKhoa" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Active</td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="chkActive1" runat="server" /></td>
                    </tr>
                </table>
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-primary font-size-08rem mb-2 float-right" OnClick="btnUpdate_Click"></asp:Button>
            </asp:View>
            <asp:View ID="v2" runat="server">
                <h5>Thêm mới lớp</h5>
                <table class="table mt-5">
                    <tr>
                        <td scope="row">Khoa</td>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="drpChonKhoa" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td scope="row">Tên lớp</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtTenLop" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Active</td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="chkActive2" runat="server" /></td>
                    </tr>
                </table>
                <asp:Button ID="btnUpdate1" runat="server" Text="Cập nhật" CssClass="btn btn-primary font-size-08rem mb-2 float-right" OnClick="btnUpdate1_Click"></asp:Button>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
