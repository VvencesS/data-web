<%@ Page Title="Import dữ liệu người dùng" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ImportDuLieuNguoiDung.aspx.cs" Inherits="DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung.ImportDuLieuNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../../Content/QLTKND.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-main-body border-bottom py-2">
        <a href="XemDuLieuNguoiDung.aspx"><i class="fas fa-home"></i></a>/ <a href="XemDuLieuNguoiDung.aspx">Dữ liệu người dùng</a>
    </div>
    <div class="content-main-body">
        <h5>Danh sách người dùng</h5>
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
        <div class="save-export float-right">
            <asp:FileUpload ID="fileUploadExcel" runat="server" CssClass="btn btn-primary font-size-08rem ml-2 mb-3" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-warning font-size-08rem px-4 mb-3" OnClick="btnUpload_Click" />
        </div>
        <asp:GridView ID="gvUser" HeaderStyle-CssClass="bg-primary text-white" ShowHeaderWhenEmpty="true"
            runat="server" AutoGenerateColumns="false" CssClass="table table-bordered font-size-08rem">
            <EmptyDataTemplate>
                <div class="text-center">No record found</div>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField HeaderText="Mã sinh viên" DataField="student_Code" />
                <asp:BoundField HeaderText="Tên sinh viên" DataField="name" />
                <asp:BoundField HeaderText="Giới tính" DataField="gener" />
                <asp:BoundField HeaderText="CMT" DataField="cmt" />
                <asp:BoundField HeaderText="Ngày sinh" DataField="birthday" DataFormatString="{0:d}"/>
                <asp:BoundField HeaderText="Địa chỉ" DataField="address" />
                <asp:BoundField HeaderText="SDT" DataField="phone" />
                <asp:BoundField HeaderText="Email" DataField="email" />
            </Columns>
        </asp:GridView>
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
