<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ImportDuLieuNguoiDung.aspx.cs" Inherits="DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung.ImportDuLieuNguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../../Content/QLTKND.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5>Danh sách người dùng</h5>
        <div class="search-info d-sm-flex justify-content-start">
                            
            <div class="form-group">
                <asp:DropDownList ID="drpChonTruong" runat="server" CssClass="form-control font-size-08rem" OnSelectedIndexChanged="drpChonTruong_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem value="0">  
                        --Chọn trường--  
                    </asp:ListItem>
                </asp:DropDownList>
                <%--<select id="" class="form-control font-size-08rem">
                    <option selected>--Chọn trường--</option>
                    <option>Đại học Điện Lực</option>
                    <option>Đại học Thủy Lợi</option>
                </select>--%>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="drpChonKhoa" runat="server" CssClass="form-control font-size-08rem" OnSelectedIndexChanged="drpChonKhoa_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem value="0">  
                        --Chọn khoa--  
                    </asp:ListItem>
                </asp:DropDownList>
               <%-- <select id="" class="form-control font-size-08rem">
                    <option selected>--Chọn khoa--</option>
                    <option>Công nghệ thông tin</option>
                    <option>Kế toán doanh nghiệp</option>
                </select>--%>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="drpChonLop" runat="server" CssClass="form-control font-size-08rem" OnSelectedIndexChanged="drpChonLop_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem value="0">  
                        --Chọn lớp--  
                    </asp:ListItem>
                </asp:DropDownList>
                <%--<select id="" class="form-control font-size-08rem">
                    <option selected>--Chọn lớp--</option>
                    <option>D12CNPM1</option>
                    <option>D12CNPM2</option>
                </select>--%>
            </div>
                             
        </div>
        <div class="save-export">
            <%--<button type="button" class="btn btn-primary font-size-08rem float-right ml-2 mb-3">Import</button>
            <button type="button" class="btn btn-warning font-size-08rem float-right px-4 mb-3">Lưu</button>--%>
            <asp:FileUpload ID="fileUploadExcel" runat="server" CssClass="btn btn-primary font-size-08rem float-right ml-2 mb-3" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btn btn-warning font-size-08rem float-right px-4 mb-3" />
        </div>
        <asp:GridView ID="tblUser" runat="server" CssClass="table" AllowPaging = "true">         
            <%--<Columns>
                <asp:TemplateField HeaderText="Mã sinh viên">
                    <ItemTemplate>
                        <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("student_Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên sinh viên">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giới tính">
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CMT">
                    <ItemTemplate>
                        <asp:Label ID="lblCMT" runat="server" Text='<%#Eval("cmt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày sinh">
                    <ItemTemplate>
                        <asp:Label ID="lblBirthday" runat="server" Text='<%#Eval("birthday") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Địa chỉ">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>--%>
        </asp:GridView>
        <%--<table class="table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã sinh viên</th>
                    <th>Tên sinh viên</th>
                    <th>CMT/Thẻ căn cước</th>
                    <th>Giới Tính</th>
                    <th>Ngày sinh</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="row">1</td>
                    <td>1781310025</td>
                    <td>Trần Đức Soạn</td>
                    <td>12354568</td>
                    <td>Nam</td>
                    <td>23/11/1999</td>
                    <td>Hoàn tất</td>                                    
                </tr>                               
            </tbody>
        </table>--%>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-backward"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-forward"></i></a>
            </li>
        </ul>
</asp:Content>
