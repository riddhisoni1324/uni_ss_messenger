<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TypeMaster.aspx.cs" Inherits="TypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <asp:Label ID="l_type_desc" runat="server" Text="Type Description" 
        CssClass="label_dim"></asp:Label>
    <asp:TextBox ID="t_type_desc" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="l_type_update" runat="server" Text="Updated By" 
        CssClass="label_dim"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="t_type_update" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="add_type" runat="server" Text="Add Type" CssClass="btn_dim" 
        onclick="btn_add_type" />
    <br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="TypeID" HeaderText="TypeID" InsertVisible="False" 
            ReadOnly="True" SortExpression="TypeID" />
        <asp:BoundField DataField="TypeDesc" HeaderText="TypeDesc" 
            SortExpression="TypeDesc" />
        <asp:BoundField DataField="IsDeleted" HeaderText="IsDeleted" 
            SortExpression="IsDeleted" />
        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" 
            SortExpression="UpdatedBy" />
        <asp:BoundField DataField="UpdatedOn" HeaderText="UpdatedOn" 
            SortExpression="UpdatedOn" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="CategoryIDLabel" runat="server" 
                        Text='<%# Eval("CategoryID") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescLabel" runat="server" 
                        Text='<%# Eval("CategoryDesc") %>' />
                </td>
                <td>
                    <asp:Label ID="IsDeletedLabel" runat="server" Text='<%# Eval("IsDeleted") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedByLabel" runat="server" Text='<%# Eval("UpdatedBy") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedOnLabel" runat="server" Text='<%# Eval("UpdatedOn") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="CategoryIDLabel1" runat="server" 
                        Text='<%# Eval("CategoryID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CategoryDescTextBox" runat="server" 
                        Text='<%# Bind("CategoryDesc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IsDeletedTextBox" runat="server" 
                        Text='<%# Bind("IsDeleted") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UpdatedByTextBox" runat="server" 
                        Text='<%# Bind("UpdatedBy") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UpdatedOnTextBox" runat="server" 
                        Text='<%# Bind("UpdatedOn") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CategoryDescTextBox" runat="server" 
                        Text='<%# Bind("CategoryDesc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IsDeletedTextBox" runat="server" 
                        Text='<%# Bind("IsDeleted") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UpdatedByTextBox" runat="server" 
                        Text='<%# Bind("UpdatedBy") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UpdatedOnTextBox" runat="server" 
                        Text='<%# Bind("UpdatedOn") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="CategoryIDLabel" runat="server" 
                        Text='<%# Eval("CategoryID") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescLabel" runat="server" 
                        Text='<%# Eval("CategoryDesc") %>' />
                </td>
                <td>
                    <asp:Label ID="IsDeletedLabel" runat="server" Text='<%# Eval("IsDeleted") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedByLabel" runat="server" Text='<%# Eval("UpdatedBy") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedOnLabel" runat="server" Text='<%# Eval("UpdatedOn") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    CategoryID</th>
                                <th runat="server">
                                    TypeID</th>
                                <th runat="server">
                                    CategoryDesc</th>
                                <th runat="server">
                                    IsDeleted</th>
                                <th runat="server">
                                    UpdatedBy</th>
                                <th runat="server">
                                    UpdatedOn</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="CategoryIDLabel" runat="server" 
                        Text='<%# Eval("CategoryID") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescLabel" runat="server" 
                        Text='<%# Eval("CategoryDesc") %>' />
                </td>
                <td>
                    <asp:Label ID="IsDeletedLabel" runat="server" Text='<%# Eval("IsDeleted") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedByLabel" runat="server" Text='<%# Eval("UpdatedBy") %>' />
                </td>
                <td>
                    <asp:Label ID="UpdatedOnLabel" runat="server" Text='<%# Eval("UpdatedOn") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [CategoryMaster]"></asp:SqlDataSource>
    <br />
    <br />
   
    <asp:Panel ID="Panel1" runat="server">
     <table style="width:100%;">
        <tr>
             <td colspan="2" style="font-size:large; color:red; height: 50px; text-align:center; border:solid; border-width:thin; border-color:black; "><strong>Add Faculty</strong></td>
             <td style="padding-top:15px; padding-bottom:0px; width:50%; height:330px; border:solid; border-width:thin" rowspan="4" >
                 <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" 
                     Width="448px" Height="200px" style="margin-top: 0px"  OnEditCommand="Edit_Command">
                  <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                         <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                         <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    
                         
                     <ItemTemplate>
                     <table  style="padding:4px; Font-Size:medium; width:100%; overflow:auto" >
                                <tr>
                                    <td style="width:10%">
                                        &nbsp;<%# Eval("TypeID") %></td>
                                    <td style="width:80%">
                                        &nbsp;<%# Eval("TypeDesc")%></td>
                                    <td style="width:10%">
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("TypeID") %>'></asp:LinkButton>
                                    </td><td style="width:15%">    
                                    &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" Text="Delete"  CommandName="Delete" OnClientClick="return confirm('Are you Sure to Delete Selected Record?')" Visible="false"></asp:LinkButton>
                                    </td>

                                </tr>
                                <tr><td id="Td1" runat="server" style="">
                    </td></tr>
                         </table>
                     </ItemTemplate>
                 </asp:DataList>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TypeID], [TypeDesc] FROM [TypeMaster]">
                 </asp:SqlDataSource>
               
        </tr>
        <tr>
           <td style="text-align:right; width:293px; height:70px; font-size:small"><b>Faculty Code</b> &nbsp;&nbsp; </td>
                 <td style="padding-top:15px; padding-bottom:0px;" class="auto-style1" >
                     &nbsp;&nbsp;<asp:TextBox ID="t_type_id1" name="txtFacultyCode" runat="server" BorderStyle="Solid" borderwidth="1" BorderColor="GrayText" enabled="true" MaxLength="6" Width="167px" height="30px"></asp:TextBox>
                 </td>

        </tr>
        <tr>
            <td style="height: 37px; text-align:right; width: 293px; font-size:small"><b>Faculty Name</b> &nbsp;&nbsp;</td>
                 <td style="padding-top:15px; padding-bottom:0px;" class="auto-style1">
                     &nbsp;&nbsp;<asp:TextBox ID="t_type_desc1" name ="txtFacultyName" runat="server" BorderStyle="Solid" BorderWidth="1" BorderColor="GrayText" Enabled="true" MaxLength="100" style="width:92%; Height:30px;"></asp:TextBox>
                 </td>
        </tr>
        <tr>
                 <td style="height: 65px; width:15%"></td>
                 <td class="auto-style2" >
                     <asp:label runat="server" ID="lblFacultyID" Visible="false" ></asp:label>
                     &nbsp;&nbsp;&nbsp;<asp:Button ID="btnSave" runat="server"  Text="Save"  
                         Width="100px" CssClass="btn btn-primary btn-large" Font-Bold="True" 
                         onclick="btnSave_Click" />&nbsp;
                     <asp:Button ID="btnBack" runat="server" Text="Back" Width="100px" CssClass="btn btn-primary btn-large" Font-Bold="True" />
                 </td>                 
        </tr>
    </table>
    </asp:Panel>



</asp:Content>

