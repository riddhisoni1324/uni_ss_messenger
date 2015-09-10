<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MemberMaster.aspx.cs" Inherits="MemberMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
        <asp:Label ID="l_mem_name" runat="server" Text="MemberName"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_name" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_desc" runat="server" Text="MemberDesc"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_desc" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_add1" runat="server" Text="Address1"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_add1" runat="server" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="_mem" runat="server" Text="Address2"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_add2" runat="server" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_pin" runat="server" Text="Pincode"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_pin" runat="server" style="margin-left: 0px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_con1" runat="server" Text="Contact1"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_con1" runat="server" style="margin-left: 62px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_con2" runat="server" Text="Contect2"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_con2" runat="server" style="margin-left: 56px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_con3" runat="server" Text="Contact3"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_con3" runat="server" style="margin-left: 52px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_email" runat="server" Text="EmailID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_email" runat="server" style="margin-left: 61px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="t_mem_email" ErrorMessage="Enter Valid Email Id" 
            ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="l_mem_login" runat="server" Text="LoginId"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_login" runat="server" style="margin-left: 59px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="l_mem_loginpass" runat="server" Text="LoginPass"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_loginpass" runat="server" style="margin-left: 43px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="update" runat="server" Text="UpdatedBy"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="t_mem_update" runat="server" style="margin-left: 37px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Button" ValidationGroup="f" />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Button" />
    </p>
    <p>
    </p>
</asp:Content>

