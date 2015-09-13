
<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 672px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div>
       <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
       <asp:TextBox ID="TextBox2"  runat="server"></asp:TextBox>
       <asp:Button ID="Button1" runat="server" Text="Button" onclick="update"/>

    <table style="height: 79px; width: 429px">
        <asp:DataList ID="DataList1" runat="server" OnEditCommand="Edit_Command">
        <HeaderTemplate>
        <h1> Details </h1>
        </HeaderTemplate>
      <ItemTemplate>
        <tr>
        <td><h4>Roll Number</h4> </td>
         <td><h4>NAME</h4></td>
          <td><h4>AGE</h4></td>
           <td><h4>CITY</h4></td>
           <td><h4>COURSE</h4></td>
           <td>link</td>
        </tr>
        <tr>
        <td><h5><%#Eval("roll_no") %></h5></td>
         <td><h5><%#Eval("s_name") %></h5></td>
          <td><h5><%#Eval("age") %></h5></td>
           <td><h5><%#Eval("city") %></h5></td>
            <td><h5><%#Eval("course") %></h5></td>
            <td><asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("roll_no") %>'></asp:LinkButton>
                                    </td>
        </tr>
        </ItemTemplate>
        </asp:DataList>
       </table>
   <table>
  <tr>
    <td>
        <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px" 
                    Width="43px" onclick="btnfirst_Click" /></td>
        <td>
            <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px" 
                    Width="43px" onclick="btnprevious_Click" /></td>
            <td>
                <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" 
                    Width="43px" onclick="btnnext_Click" /></td>
                <td>
                    <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px" 
                    Width="43px" onclick="btnlast_Click" /></td>
    </tr>
   </table>
    </div>
    </form>
</body>
</html>