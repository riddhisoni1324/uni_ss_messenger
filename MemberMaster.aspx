<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MemberMaster.aspx.cs" Inherits="MemberMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 147px;
            height: 50px;
        }
        .style3
        {
            width: 481px;
        }
        .style6
        {
            width: 244px;
            height: 50px;
        }
        .style7
        {
            width: 481px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <%--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>--%>
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
                            <asp:Button ID="b_add_type" runat="server" Text="Add Member" OnClick="b_add_type_Click"
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
                        <asp:Label ID="l_mem_name" runat="server" Text="MemberName"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_name" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                     <td class="style7" >
                       
                        </td>
                    
                     <td class="style6" rowspan="4" colspan="2">
                        
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                         <asp:Label ID="Label2" runat="server" Text="Type :"></asp:Label>
                         <br /><br />
                        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TypeDesc"
                            DataValueField="TypeID" SelectionMode="Multiple" AutoPostBack="True" 
                             OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" 
                             style="margin-left: 98px" Width="246px" AppendDataBoundItems="true">
                            <%-- <asp:ListItem Text="select all" Value="all" runat="server" />--%>
                        </asp:ListBox>
                        
                       
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                             ControlToValidate="ListBox1" ErrorMessage="Select type" 
                             ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                        
                         <br />
                        
                         <br />
                        
                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click1" 
                             Text="select all type" style="margin-left: 94px" />
                         
                        
                       
                        </td>
                        <td class="table_wid" >
                       
                       
                        </td>
                        <td class="table_wid" >
                       
                        </td>
                       
                        
                       
                       
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_desc" runat="server" Text="MemberDesc"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_desc" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                    
                </tr>
                 <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_code" runat="server" Text="MemberCode"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_code" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="t_mem_code" ErrorMessage="this field is required" 
                            ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                       
                        </td>
                    
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_add1" runat="server" Text="Address1"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_add1" runat="server" TextMode="MultiLine" CssClass="radius"
                            Width="161px"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="_mem" runat="server" Text="Address2"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_add2" runat="server" TextMode="MultiLine" CssClass="radius"
                            Width="160px"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                         <td class="style6" rowspan="4" colspan="2">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                             <asp:Label ID="Label1" runat="server" Text="Category :"></asp:Label>
                        
                    
                             <br />
                             <br />
                        
                    
                        <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple" Height="158px" 
                                 style="margin-left: 102px" Width="262px" 
                                 ></asp:ListBox>
                             <br />
                            
                            
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                 ControlToValidate="ListBox2" ErrorMessage="select cat" ForeColor="#FF3300" 
                                 ValidationGroup="f"></asp:RequiredFieldValidator>
                             <br />
                             <br />
                             <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                                 Text="select all category" Width="128px" style="margin-left: 107px" />
                        </td>
                        <td class="table_wid" >
                       
                        </td>
                        <td class="table_wid" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_pin" runat="server" Text="Pincode"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_pin" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="t_mem_pin"
                            ErrorMessage="Enter Valid PinCode" ValidationExpression="\d{6}" 
                            ForeColor="#FF3300" ValidationGroup="f"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con1" runat="server" Text="Contact1"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_con1" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con2" runat="server" Text="Contect2"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_con2" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_con3" runat="server" Text="Contact3"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_con3" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_email" runat="server" Text="EmailID"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_email" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style3">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="t_mem_email"
                            ErrorMessage="Enter Valid Email Id" ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="f"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="t_mem_email" ErrorMessage="this field is required" 
                            ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr class="table_wid">
                    <td class="table_wid">
                        <asp:Label ID="l_mem_login" runat="server" Text="LoginId"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_login" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="t_mem_login" ErrorMessage="this field is required" 
                            ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="l_mem_loginpass" runat="server" Text="LoginPass"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_loginpass" runat="server" CssClass="radius" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
                <tr>
                    <td class="table_wid">
                        <asp:Label ID="update" runat="server" Text="UpdatedBy"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_mem_update" runat="server" CssClass="radius"></asp:TextBox>
                    </td>
                    <td class="style7" >
                       
                        </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
            <p>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Width="100px" Text="Save" ValidationGroup="f" 
                    OnClick="Button1_Click" />
                <asp:Button ID="t_back" runat="server" Font-Bold="True" OnClick="Button3_Click" 
                    Text="Back" Width="100px" />
                <asp:TextBox ID="h_id" runat="server" Visible="False"></asp:TextBox>
            </p>
        
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
