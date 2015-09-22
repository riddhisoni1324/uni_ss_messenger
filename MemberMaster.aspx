<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MemberMaster.aspx.cs" Inherits="MemberMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=ListBox1]').multiselect({
                includeSelectAllOption: true
            });

            $('[id*=ListBox2]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
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
                                &nbsp;<%# Eval("MemberName") %></td>
                                <td style="width: 10%">
                                &nbsp;<%# Eval("MemberDesc") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("Address1")%></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("contact1")%></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("EmailId")%></td>
                            
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("memberid") %>'></asp:LinkButton>
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
                    <td class="table_wid">
                        Type
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Button" Visible="False" />
                    </td>
                    <td class="table_wid">
                        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TypeDesc"
                            DataValueField="TypeID" SelectionMode="Multiple" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
                        </asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        Category
                    </td>
                    <td class="table_wid">
                        <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_name" runat="server" Text="MemberName"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_name" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_desc" runat="server" Text="MemberDesc"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_desc" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_add1" runat="server" Text="Address1"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_add1" runat="server" TextMode="MultiLine" CssClass="radius"
                            Width="195px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="_mem" runat="server" Text="Address2"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_add2" runat="server" TextMode="MultiLine" CssClass="radius"
                            Width="195px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_pin" runat="server" Text="Pincode"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_pin" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="t_mem_pin"
                            ErrorMessage="Enter Valid PinCode" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con1" runat="server" Text="Contact1"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_con1" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con2" runat="server" Text="Contect2"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_con2" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con3" runat="server" Text="Contact3"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_con3" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_email" runat="server" Text="EmailID"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_email" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="t_mem_email"
                            ErrorMessage="Enter Valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_login" runat="server" Text="LoginId"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_login" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_loginpass" runat="server" Text="LoginPass"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_loginpass" runat="server" CssClass="radius" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="update" runat="server" Text="UpdatedBy"></asp:Label>
                    </td>
                    <td class="table_wid">
                        <asp:TextBox ID="t_mem_update" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
            <p>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Add Member" ValidationGroup="f" OnClick="Button1_Click" />
                <asp:Button ID="t_back" runat="server" Font-Bold="True" OnClick="Button3_Click" 
                    Text="Back" Width="100px" />
                <asp:TextBox ID="h_id" runat="server" Visible="False"></asp:TextBox>
            </p>
        
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
