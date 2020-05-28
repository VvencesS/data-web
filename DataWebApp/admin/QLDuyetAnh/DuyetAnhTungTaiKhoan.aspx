<%@ Page Title="Duyệt ảnh từng tài khoản" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DuyetAnhTungTaiKhoan.aspx.cs" Inherits="DataWebApp.admin.QLDuyetAnh.DuyetAnhTungTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/DuyetAnh.css" rel="stylesheet" />
    <link href="../../Content/Uploadimg.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="DuyetAnhTheoNhom.aspx"><i class="fas fa-home"></i></a>/ <a href="DuyetAnhTheoNhom.aspx">Quản lý duyệt ảnh</a>
    </div>
    <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
        <asp:View ID="v0" runat="server">
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
                <asp:HiddenField ID="hdIDImg" runat="server" />

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
                                <th>Duyệt ảnh</th>
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
                            <td><%#:Eval("statusImg") %></td>
                            <td>
                                <asp:LinkButton ID="lnkStatus" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_Image") %>'>Kích hoạt</asp:LinkButton>
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
        </asp:View>
        <asp:View ID="View1" runat="server">
            <div class="content-main-body">
                <h5>Danh sách sinh viên</h5>
                <div class="photos-contents">
                    <table>
                        <tr>
                            <td>
                                <div class="item ml-5 mb-5">
                                    <p class="question">
                                        <span class="font-weight-bold">Câu hỏi: </span>
                                        <asp:Label ID="lblCauHoi" runat="server" Text="Label"></asp:Label>
                                        <span style="color: red;">*</span>
                                    </p>
                                    <div class="img-user d-flex px-5">
                                        <asp:Image ID="imgDes" runat="server" CssClass="pull-left img-user-sample mx-5" />
                                        <asp:Image ID="imgPath" runat="server" CssClass="pull-left img-user-sample mr-2" />
                                    </div>
                                </div>
                            </td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:DropDownList ID="drpDuyet" runat="server" CssClass="form-control font-size-08rem ml-5 mb-3">
                                    <asp:ListItem Selected="True">--Duyệt ảnh--</asp:ListItem>
                                    <asp:ListItem Value="True">Duyệt ảnh</asp:ListItem>
                                    <asp:ListItem Value="False">Từ chối</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <p class="ml-5">Ghi chú:</p>
                                <asp:TextBox ID="txtGHiChu" runat="server" TextMode="MultiLine" CssClass="form-control font-size-08rem ml-5 mb-3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:LinkButton ID="lnkInsertUpdate" runat="server" CommandName="update" CssClass="px-2 btn btn-primary font-size-08rem float-right" OnClick="lnkInsertUpdate_Click">
                                            Cập nhật
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
