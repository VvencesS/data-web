<%@ Page Title="Xem sửa xóa câu hỏi" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="XemSuaXoa.aspx.cs" Inherits="DataWebApp.admin.QLCauHoi.XemSuaXoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/CauHoi.css" rel="stylesheet" />
    <link href="../../Content/Uploadimg.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
        <asp:View ID="v0" runat="server">
            <div class="header-main-body border-bottom py-2">
                <a href="XemSuaXoa.aspx"><i class="fas fa-home"></i></a>/ <a href="XemSuaXoa.aspx">Quản lý câu hỏi</a>
            </div>
            <div class="content-main-body">
                <h5>Danh sách câu hỏi</h5>
                <div class="search-info d-sm-flex justify-content-start">
                    <div class="form-group">
                        <asp:TextBox ID="txtTimKiem" runat="server" CssClass="form-control font-size-08rem">Tìm kiếm</asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="drpChonTrangThai" runat="server" CssClass="form-control font-size-08rem" AutoPostBack="True" OnSelectedIndexChanged="drpChonTrangThai_SelectedIndexChanged">
                            <asp:ListItem Selected="True"> --Trạng thái--</asp:ListItem>
                            <asp:ListItem Value="True">Kích hoạt</asp:ListItem>
                            <asp:ListItem Value="False">Chờ Duyệt</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:LinkButton ID="lnkTimKiem" runat="server" CssClass="btn btn-primary font-size-08rem mb-3" OnClick="lnkTimKiem_Click">Tìm kiếm</asp:LinkButton>
                </div>
                <asp:HiddenField ID="hdInsert" runat="server" />
                <asp:HiddenField ID="hdIDQuestion" runat="server" />
                <asp:HiddenField ID="hdImage" runat="server" />
                <div class="save-export">
                    <asp:LinkButton ID="lnkThemMoi" runat="server" CssClass="btn btn-primary font-size-08rem float-right ml-2 mb-3" OnClick="lnkThemMoi_Click">Thêm mới</asp:LinkButton>
                </div>
                <asp:Repeater ID="rptQuestion" runat="server" OnItemCommand="rptQuestion_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-bordered">
                            <tr>
                                <th>Nội dung</th>
                                <th>Bắt buộc</th>
                                <th>Ảnh mô tả</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#:Eval("content") %></td>
                            <td><%#:Eval("obligatory") %></td>
                            <td>
                                <img src='/images/question/<%#:Eval("image_Des") %>' width="100px" />
                            </td>
                            <td><%#:Eval("status") %></td>
                            <td>
                                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_Question") %>'>Cập nhật</asp:LinkButton>
                                &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%#:Eval("id_Question") %>' OnLoad="msgDelete">Xóa</asp:LinkButton>
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
        <asp:View ID="v1" runat="server">
            <div class="header-main-body border-bottom py-2">
                <a href="XemSuaXoa.aspx"><i class="fas fa-home"></i></a>/ <a href="XemSuaXoa.aspx">Quản lý câu hỏi</a>
            </div>
            <div class="content-main-body">
                <h5>Cập nhật câu hỏi</h5>
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
        </asp:View>
    </asp:MultiView>
</asp:Content>
