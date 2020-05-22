<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ImportDSNhom.aspx.cs" Inherits="DataWebApp.admin.QLDSNhomCoDinh.ImportDSNhom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/DSNhom.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5>Danh sách nhóm</h5>
        <div class="search-info d-sm-flex justify-content-start">
            <div class="form-group">
                <asp:DropDownList ID="drpChonTruong" runat="server" CssClass="form-control font-size-08rem">
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
                <asp:DropDownList ID="drpChonKhoa" runat="server" CssClass="form-control font-size-08rem">
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
                <asp:DropDownList ID="drpChonLop" runat="server" CssClass="form-control font-size-08rem">
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
            <button type="button" class="btn btn-primary font-size-08rem float-right ml-2 mb-3">Import</button>
            <button type="button" class="btn btn-warning font-size-08rem float-right px-4 mb-3">Lưu</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Trường</th>
                    <th>Khoa</th>
                    <th>Lớp</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
                <tr>
                    <td scope="row">1</td>
                    <td>Đại học Điện Lực</td>
                    <td>Công nghệ thông tin</td>
                    <td>D12CNPM1</td>
                    <td>Hoàn tất</td>
                </tr>
            </tbody>
        </table>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-backward"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-forward"></i></a>
            </li>
        </ul>
</asp:Content>
