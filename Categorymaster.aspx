<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Categorymaster.aspx.cs" Inherits="Categorymaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:Label ID="l_cat_type" runat="server" Text="TypeName"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="TypeMaster1" 
        DataTextField="TypeDesc" DataValueField="TypeID" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged" CssClass="input_dim">
    </asp:DropDownList>
    <br /><br />
    <asp:Label ID="l_cat_desc" runat="server" Text="Category Description" 
        CssClass="label_dim"></asp:Label>
    <asp:TextBox ID="t_cat_desc" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="l_cat_update" runat="server" Text="Updated By" 
        CssClass="label_dim"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="t_cat_update" runat="server" CssClass="input_dim"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="add_cat" runat="server" onclick="btn_add_cat" 
        Text="Add Category" CssClass="btn_dim"  />
&nbsp;<br />
    <asp:SqlDataSource ID="TypeMaster1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TypeMaster]"></asp:SqlDataSource>
    <br />
    &nbsp;
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="CatMaster">
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
            <asp:BoundField DataField="TypeID" HeaderText="TypeID" 
                SortExpression="TypeID" />
            <asp:BoundField DataField="CategoryDesc" HeaderText="CategoryDesc" 
                SortExpression="CategoryDesc" />
            <asp:BoundField DataField="IsDeleted" HeaderText="IsDeleted" 
                SortExpression="IsDeleted" />
            <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" 
                SortExpression="UpdatedBy" />
            <asp:BoundField DataField="UpdatedOn" HeaderText="UpdatedOn" 
                SortExpression="UpdatedOn" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="CatMaster" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [CategoryMaster]"></asp:SqlDataSource>
</asp:Content>

