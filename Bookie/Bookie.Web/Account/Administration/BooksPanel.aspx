<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Administration/Administration.master"
    AutoEventWireup="true" CodeBehind="BooksPanel.aspx.cs"
    Inherits="Bookie.Web.Account.Administration.BooksPanel" %>

<asp:Content ID="ContentBooks" ContentPlaceHolderID="AdminContent" runat="server">
    <asp:GridView ID="GridViewBooks" runat="server"
        SelectMethod="GridViewBooks_GetData"
        UpdateMethod="GridViewBooks_UpdateItem"
        ItemType="Bookie.Models.Book"
        AllowPaging="True"
        AllowSorting="True"
        DataKeyNames="Id"
        AutoGenerateEditButton="true"
        AutoGenerateColumns="false">

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Isbn" HeaderText="ISBN" />
            <asp:BoundField DataField="CatalogNumber" HeaderText="Catalog Number" />
            <asp:CheckBoxField DataField="IsAvailable" HeaderText="Available" SortExpression="IsAvailable" />
            <asp:CheckBoxField DataField="IsUsed" HeaderText="Used" SortExpression="IsUsed" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
        </Columns>
    </asp:GridView>
</asp:Content>
