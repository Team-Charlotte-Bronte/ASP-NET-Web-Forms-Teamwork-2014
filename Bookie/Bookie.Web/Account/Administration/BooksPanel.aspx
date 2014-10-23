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
                  AutoGenerateEditButton="true" 
                  DataKeyNames="Id"
                  AutoGenerateSelectButton="true"
                  OnSelectedIndexChanged="GridViewBooks_SelectedIndexChanged"
                  AutoGenerateColumns="false"
                  CssClass="table table-hover table-striped">

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Isbn" HeaderText="ISBN" SortExpression="Isbn" />
            <asp:BoundField DataField="CatalogNumber" HeaderText="Catalog Number" SortExpression="CatalogNumber" />
            <asp:CheckBoxField DataField="IsApproved" HeaderText="Is Approved" SortExpression="IsApproved" />
            <asp:CheckBoxField DataField="IsAvailable" HeaderText="Available" SortExpression="IsAvailable" />
            <asp:CheckBoxField DataField="IsUsed" HeaderText="Used" SortExpression="IsUsed" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
        </Columns>
    </asp:GridView>
    <asp:Label Text="" runat="server" ID="LabelId" />

    <asp:FormView runat="server" ID="FormViewDetails"
                  ItemType="Bookie.Models.Book">
        <ItemTemplate>
            <div class="list-group">
                <div class="list-group-item">
                    <strong>Title:</strong> <%#: Item.Name %> 
                    <br />
                    <strong>ISBN:</strong> <%#: Item.Isbn %>
                    <br />
                    <strong>Year:</strong> <%#: Item.Year %>
                    <br />
                    <strong>Pages:</strong> <%#: Item.NumberOfPages %>
                    <br />
                    <strong>Category:</strong> <%#: Item.Category.Name == null ? " ": Item.Category.Name%>
                    <br />
                    <strong>Subcategory:</strong> <%#: Item.SubCategory.Name == null ? " ": Item.SubCategory.Name %>
                    <br />
                    <strong>Price:</strong> <%#: Item.Price %>
                    <br />
                    <strong>Date Added:</strong> <%#: Item.DateAdded %>
                    <br />
                    <strong>Comments:</strong> <%#: string.Join("; ", Item.Comments)%>
                    <br />
                    <strong>Description:</strong> <%#: Item.Description%>
                    <br />
                    <strong>Publisher:</strong> <%#: Item.Publisher.Name %>
                    <br />
                    <strong>Is Approved:</strong> <%#: Item.IsApproved %>
                    <br />
                    <strong>Is Available:</strong> <%#: Item.IsAvailable %>
                    <br />
                    <strong>Is Used:</strong> <%#: Item.IsUsed %>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

</asp:Content>
