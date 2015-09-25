<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Categorymaster.aspx.cs" Inherits="Categorymaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 36px;
        }
        .btn-large
        {
            margin-left: 25px;
        }
        .style4
        {
            height: 47px;
        }
        .style5
        {
            height: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="TypeMaster1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
    <br />
    &nbsp;
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
                            <td style="width: 200px">
                                &nbsp;<%# Eval("CategoryID") %></td>
                            <td style="width: 200px">
                                &nbsp;<%# Eval("TypeDesc") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("CategoryDesc")%></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("CategoryID") %>'></asp:LinkButton>
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
                            <asp:Button ID="b_add_type" runat="server" Text="Add Category" OnClick="b_add_category_click"
                                Width="100px" Font-Bold="True" Height="35px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style1">
                        <asp:Label ID="l_cat_type" runat="server" Text="TypeName"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="TypeMaster1" DataTextField="TypeDesc"
                            DataValueField="TypeID" CssClass="input_dim" Height="25px" Width="205px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="l_cat_desc" runat="server" Text="Category Description" CssClass="label_dim"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="t_cat_desc" runat="server" CssClass="input_dim" Width="208px"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t_cat_desc"
                            ErrorMessage="*This Field is Required" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                    </td>
                    <td class="style5">
                        <asp:Button ID="Button1" runat="server" Text="Save" Width="100px" CssClass="btn btn-primary btn-large"
                            Font-Bold="True" OnClick="btnSave_Click" ValidationGroup="insert" />&nbsp;
                        <asp:Button ID="t_back" runat="server" OnClick="Button3_Click" Text="Back" Width="100px"
                            Font-Bold="True" Style="margin-left: 8px" />
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="flag" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="h_id" runat="server" Visible="False"></asp:TextBox>
        </asp:View>
    </asp:MultiView>
</asp:Content>
