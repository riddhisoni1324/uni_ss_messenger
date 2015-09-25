<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="TypeMaster.aspx.cs" Inherits="TypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 344px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataList ID="DataList2" runat="server" OnEditCommand="Edit_Command">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <ItemTemplate>
                    <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                        <tr>
                            <td style="width: 10%">
                                &nbsp;<%# Eval("TypeID") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("TypeDesc")%></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("TypeID") %>'></asp:LinkButton>
                            </td>
                            <td style="width: 10%">
                                &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="return confirm('Are you Sure to Delete Selected Record?')" Visible="true"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:Panel ID="Panel1" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px"
                                Width="43px" OnClick="btnfirst_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px"
                                Width="43px" OnClick="btnprevious_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" Width="43px"
                                OnClick="btnnext_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px"
                                Width="43px" OnClick="btnlast_Click" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="b_add_type" runat="server" Text="Add Type" OnClick="b_add_type_Click"
                                Width="100px" Font-Bold="True" Height="35px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="l_type_id" runat="server" Text="Type Id"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;<asp:TextBox ID="t_type_id" name="txtFacultyCode" runat="server" BorderStyle="Solid"
                            BorderWidth="1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="l_type_desc" runat="server" Text="Type Desc"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;<asp:TextBox ID="t_type_desc" name="txtFacultyName" runat="server"  CssClass="input_dim"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This Field is required"
                            ControlToValidate="t_type_desc" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 65px; width: 15%">
                    </td>
                    <td class="style1">
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Save" Width="100px"
                            CssClass="btn btn-primary btn-large" Font-Bold="True" OnClick="btnSave_Click"
                            ValidationGroup="insert" />&nbsp;
                        <asp:Button ID="t_back" runat="server" OnClick="Button3_Click" Text="Back" Width="100px"
                            Font-Bold="True" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
