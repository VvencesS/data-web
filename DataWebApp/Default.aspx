<%@ Page Title="Up ảnh theo câu hỏi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DataWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdInsert" runat="server" />
    <asp:HiddenField ID="hdIDUser" runat="server" />
    <asp:HiddenField ID="hdIDQues" runat="server" />
    <asp:HiddenField ID="hdIDImg" runat="server" />
    <asp:HiddenField ID="hdView" runat="server" />
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
            <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
                <asp:View ID="v0" runat="server">
                    <div class="photos-contents">
                        <asp:Repeater ID="rptImgUserInsert" runat="server" OnItemCommand="rptImgUserInsert_ItemCommand">
                            <HeaderTemplate>
                                <table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div class="item ml-5 mb-5">
                                            <p class="question">
                                                <span class="font-weight-bold">Câu hỏi: </span><%#:Eval("[content]") %> <span style="color: red;">*</span>

                                            </p>
                                            <div class="img-user d-flex px-5">
                                                <img class="pull-left img-user-sample mx-5" src='/images/question/<%#:Eval("image_Des") %>' alt="">
                                                <img class="pull-left img-user-sample mr-2" src="images/admin/image-user.png" alt="">
                                            </div>
                                        </div>
                                    </td>
                                    <td>&nbsp</td>
                                    <td>&nbsp</td>
                                    <td>&nbsp</td>
                                    <td>
                                        <asp:LinkButton ID="lnkThemMoi" runat="server" CommandArgument='<%#:Eval("id_Question") %>' CssClass="px-2 btn btn-primary font-size-08rem">
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
                </asp:View>
                <asp:View ID="v1" runat="server">
                    <div class="photos-contents">
                        <asp:Repeater ID="rptImgUserUpDate" runat="server" OnItemCommand="rptImgUserUpDate_ItemCommand">
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
                                            <div class="img-user d-flex px-5">
                                                <img class="pull-left img-user-sample mx-5" src='/images/question/<%#:Eval("image_Des") %>' alt="">
                                                <img class="pull-left img-user-sample mr-2" src='/images/UserImages/<%#:Eval("image_Path") %>' alt="">
                                            </div>
                                        </div>
                                    </td>
                                    <td>&nbsp</td>
                                    <td>&nbsp</td>
                                    <td>&nbsp</td>
                                    <td>
                                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandArgument='<%#:Eval("id_Image") %>' CssClass="px-2 btn btn-primary font-size-08rem">
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
                </asp:View>
                <asp:View ID="v2" runat="server">
                    <div class="photos-contents">
                        <table>
                            <tr>
                                <td>
                                    <div class="item ml-5 mb-5">
                                        <p class="question">
                                            <span class="font-weight-bold">Câu hỏi: </span>
                                            <asp:Label ID="lblCauHoi" runat="server" Text="Label"></asp:Label>
                                            <span style="color: red;">*</span>
                                            <i class="fas fa-camera custom-file" id="uploadfile">
                                                <asp:FileUpload ID="fileUpImg" runat="server" class="custom-file-input" />
                                            </i>
                                        </p>
                                        <div class="img-user d-flex px-5">
                                            <asp:Image ID="imgDes" runat="server" CssClass="pull-left img-user-sample mx-5" />
                                            <asp:Image ID="imgPath" runat="server" CssClass="pull-left img-user-sample mr-2" />
                                        </div>
                                    </div>
                                </td>
                                <td>&nbsp</td>
                                <td>&nbsp</td>
                                <td>&nbsp</td>
                                <td>
                                    <asp:LinkButton ID="lnkInsertUpdate" runat="server" CommandArgument='<%#:Eval("id_Image") %>' CssClass="px-2 btn btn-primary font-size-08rem" OnClick="lnkInsertUpdate_Click">
                                            Cập nhật
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
    <asp:LinkButton ID="lnkLuu" runat="server"  CssClass="px-4 btn btn-warning font-size-08rem float-right mb-4" OnClick="lnkLuu_Click">
        Lưu
    </asp:LinkButton>
</asp:Content>
