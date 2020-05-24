<%@ Page Title="Xem dữ liệu người dùng" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="XemDuLieuNguoiDung.aspx.cs" Inherits="DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung.XemDuLieuNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/QLTKND.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="XemDuLieuNguoiDung.aspx"><i class="fas fa-home"></i></a>/ <a href="XemDuLieuNguoiDung.aspx">Dữ liệu người dùng</a>
    </div>
    <div class="content-main-body">
        <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
            <asp:View ID="v0" runat="server">
                <h5>Danh sách sinh viên</h5>
                <div class="search-info d-sm-flex justify-content-start">
                    <div class="form-group">
                        <asp:TextBox ID="txtTimKiem" runat="server" CssClass="form-control font-size-08rem">Tìm kiếm</asp:TextBox>
                    </div>
                    <div class="search-info d-sm-flex justify-content-start">
                        <div class="form-group">
                            <asp:DropDownList ID="drpChonTruong" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True" OnSelectedIndexChanged="drpChonTruong_SelectedIndexChanged">
                                <asp:ListItem Value="0">  
                                    --Chọn trường--  
                                </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="drpChonKhoa" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True" OnSelectedIndexChanged="drpChonKhoa_SelectedIndexChanged">
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
                <div class="save-export mt-3">
                    <asp:LinkButton ID="lnkImport" runat="server" CssClass="btn btn-primary font-size-08rem float-right ml-2 mb-3" OnClick="lnkImport_Click">Import Excel</asp:LinkButton>
                    <asp:LinkButton ID="lnkExport" runat="server" CssClass="btn btn-primary font-size-08rem float-right ml-2 mb-3" OnClick="lnkExport_Click">Export Excel</asp:LinkButton>
                </div>
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
                            <td>
                                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_User") %>'>Cập nhật</asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%#:Eval("id_User") %>' OnLoad="msgDelete">Xóa</asp:LinkButton>
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
                <h5>Cập nhật dữ liệu người dùng</h5>
                <table class="table mt-5 font-size-08rem">
                   <tr>
                        <td scope="row">Mã sinh viên:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Tên sinh viên:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Lớp:</td>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="drpLop" runat="server" CssClass="form-control"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td scope="row">Giới tính:</td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="chkGT" runat="server" CssClass="form-control"/></td>
                    </tr>
                    <tr>
                        <td scope="row">CMT:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtCMT" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Ngày sinh:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtNgaySinh" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Địa chỉ:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">SDT:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td scope="row">Email:</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                </table>
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-primary font-size-08rem mb-2 float-right" OnClick="btnUpdate_Click"></asp:Button>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
