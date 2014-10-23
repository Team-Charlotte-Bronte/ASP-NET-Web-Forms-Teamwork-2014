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
        AutoGenerateSelectButton="true"
        OnSelectedIndexChanged="GridViewBooks_SelectedIndexChanged"
        AutoGenerateColumns="false"
        CssClass="table table-hover table-striped">

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Isbn" HeaderText="ISBN" />
            <asp:BoundField DataField="CatalogNumber" HeaderText="Catalog Number" />
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
                    <strong><%#: Item.Name %> </strong>
                    <br />
                    <em>ISBN</em> <%#: Item.Isbn %>
                    <br />
                    <em>Year:</em> <%#: Item.Year %>
                    <br />
                    <em>Pages:</em> <%#: Item.NumberOfPages %>
                    <br />
                    <em>Category:</em> <%#: Item.Category.Name == null ? " ": Item.Category.Name%>
                    <br />
                    <em>Subcategory:</em> <%#: Item.SubCategory.Name == null ? " ": Item.SubCategory.Name %>
                    <br />
                    <em>Price:</em> <%#: Item.Price %>
                    <br />
                    <em>Date Added:</em> <%#: Item.DateAdded %>
                    <br />
                    <em>Comments:</em> <%#: string.Join("; ", Item.Comments)%>
                    <br />
                    <em>Description:</em> <%#: Item.Description%>
                    <br />
                    <em>Publisher:</em> <%#: Item.Publisher.Name %>
                    <br />
                    <em>Is Approved:</em> <%#: Item.IsApproved %>
                    <br />
                    <em>Is Available:</em> <%#: Item.IsAvailable %>
                    <br />
                    <em>Is Used:</em> <%#: Item.IsUsed %>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

</asp:Content>
