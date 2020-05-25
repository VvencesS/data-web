<%@ Page Title="Up ảnh theo câu hỏi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DataWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="header-main-body border-bottom py-2">
        <a href="#"><i class="fas fa-home"></i></a>/ <a href="#">Đăng ảnh theo câu hỏi</a>
    </div>
    <div class="content-main-body">
        <div class="profile d-flex">
            <div class="personal-information mr-5">
                <div class="personal-information-header d-flex align-items-end">
                    <div class="mr-2 font-weight-bold">Thông tin cá nhân</div>
                    <div class="padding-right-16rem" style="height: 1.5px; background-color: gray; margin-bottom: 4px;"></div>
                </div>
                <div class="personal-information-content">
                    <table class="table">

                        <tbody>
                            <tr>
                                <td scope="row">Mã sinh viên:</td>
                                <td>
                                    <asp:Label ID="lblMaSV" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td scope="row">Tên sinh viên:</td>
                                <td>
                                    <asp:Label ID="lblTenSV" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td scope="row">CMT:</td>
                                <td>
                                    <asp:Label ID="lblCMT" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td scope="row">Ngày sinh</td>
                                <td>
                                    <asp:Label ID="lblNS" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="basic-information">
                <div class="basic-information-header  d-flex align-items-end">
                    <div class="mr-2 font-weight-bold">Thông tin cơ bản</div>
                    <div class="padding-right-16rem" style="height: 1.5px; background-color: gray; margin-bottom: 4px;"></div>
                </div>
                <div class="basic-information-content">
                    <table class="table">

                        <tbody>
                            <tr>
                                <td scope="row">Trường:</td>
                                <td>Đại học Điện Lực</td>
                            </tr>
                            <tr>
                                <td scope="row">Khoa:</td>
                                <td>
                                    <asp:Label ID="lblKhoa" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td scope="row">Lớp:</td>
                                <td>
                                    <asp:Label ID="lblLop" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="photos">
            <div class="photos-header  d-flex align-items-end">
                <div class="mr-2 font-weight-bold">Đăng ảnh theo câu hỏi</div>
                <div class="padding-right-16rem" style="height: 1.5px; background-color: gray; margin-bottom: 4px;"></div>
            </div>
            <div class="photos-contents">
                <asp:Repeater ID="rptImgUser" runat="server">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div class="item ml-5 mb-5">
                                    <p class="question">
                                        <span class="font-weight-bold">Câu hỏi: </span><%#:Eval("[content]") %> <span style="color: red;">*</span>
                                        <i class="fas fa-camera custom-file" id="uploadfile">
                                            <asp:FileUpload ID="fileUpImg" runat="server" class="custom-file-input" />
                                        </i>
                                    </p>
                                    <div class="img-user d-flex px-4">
                                        <img class="pull-left img-user-sample mr-2" src='/images/question/<%#:Eval("image_Des") %>' alt="">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkKichHoat" runat="server" CommandName="update" CommandArgument='<%#:Eval("id_Question") %>' CssClass="p-2 btn btn-primary font-size-08rem">
                                    Cập nhật
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>

</asp:Content>
