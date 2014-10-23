<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Administration/Administration.master"
AutoEventWireup="true" CodeBehind="BooksApprove.aspx.cs"
Inherits="Bookie.Web.Account.Administration.BooksApprove" %>

<asp:Content ID="ContentBooksApprove" ContentPlaceHolderID="AdminContent" runat="server">
    <asp:GridView ID="GridViewBooks" runat="server"
                  SelectMethod="GridViewBooks_GetData"
                  UpdateMethod="GridViewBooks_UpdateItem"
                  ItemType="Bookie.Models.Book"
                  AllowPaging="True"
                  AllowSorting="True"
                  DataKeyNames="Id"
                  PageSize="5"
                  AutoGenerateSelectButton="true"
                  OnSelectedIndexChanged="GridViewBooks_SelectedIndexChanged"
                  AutoGenerateColumns="false"
                  CssClass="table table-hover table-striped">

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="AuthorComment" HeaderText="Author Comment" SortExpression="AuthorComment" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
        </Columns>
    </asp:GridView>
</asp:Content>