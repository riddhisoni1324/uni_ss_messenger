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
    <asp:Label ID="l_type_desc" runat="server" Text="Type Description" CssClass="label_dim"></asp:Label>
    <asp:TextBox ID="t_type_desc" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="l_type_update" runat="server" Text="Updated By" CssClass="label_dim"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="t_type_update" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="add_type" runat="server" Text="Add Type" CssClass="btn_dim" OnClick="btn_add_type" />
    <br />
    <br />
    <br />

    <asp:Panel ID="Panel2" runat="server">
        <table style="width: 100%;">
            <tr>
                <td colspan="2" style="font-size: large; color: red; height: 50px; text-align: center;
                    border: solid; border-width: thin; border-color: black;">
                    <strong>Add Type</strong>
                </td>
                <td style="padding-top: 15px; padding-bottom: 0px; width: 50%; height: 330px; border: solid;
                    border-width: thin" rowspan="4">
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
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 293px; height: 70px; font-size: small">
                    <b>Type Id</b> &nbsp;&nbsp;
                </td>
                <td style="padding-top: 15px; padding-bottom: 0px;" class="style1">
                    &nbsp;&nbsp;<asp:TextBox ID="TextBox1" name="txtFacultyCode" runat="server" BorderStyle="Solid"
                        BorderWidth="1" BorderColor="GrayText" Enabled="true" MaxLength="6" Width="167px"
                        Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 37px; text-align: right; width: 293px; font-size: small">
                    <b>Type Name</b> &nbsp;&nbsp;
                </td>
                <td style="padding-top: 15px; padding-bottom: 0px;" class="style1">
                    &nbsp;&nbsp;<asp:TextBox ID="TextBox2" name="txtFacultyName" runat="server" BorderStyle="Solid"
                        BorderWidth="1" BorderColor="GrayText" Enabled="true" MaxLength="100" Style="width: 92%;
                        height: 30px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 65px; width: 15%">
                </td>
                <td class="style1">
                    <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Save" Width="100px"
                        CssClass="btn btn-primary btn-large" Font-Bold="True" OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Back" Width="100px" CssClass="btn btn-primary btn-large"
                        Font-Bold="True" />
                </td>
            </tr>
        </table>
    </asp:Panel>





    <p>
        &nbsp;</p>



</asp:Content>
