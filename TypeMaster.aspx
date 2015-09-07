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
</asp:Content>

