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
            <div class="modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Book: <%#: Item.Name %></h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                Name: <%#: Item.Name %>
                                <br />
                                ISBN: <%#: Item.Isbn %>
                                <br />
                                Year: <%#: Item.Year %>
                                <br />
                                Pages: <%#: Item.NumberOfPages %>
                                <br />
                                Category: <%#: Item.Category.Name %>
                                <br />
                                Subcategory: <%#: Item.SubCategory.Name %>
                                <br />
                                Price: <%#: Item.Price %>
                                <br />
                                Date Added: <%#: Item.DateAdded %>
                                <br />
                                Comments: <%#: string.Join("; ", Item.Comments)%>
                                <br />
                                Description: <%#: Item.Description%>
                                <br />
                                Publisher: <%#: Item.Publisher.Name %>
                                <br />
                                Is Approved: <%#: Item.IsApproved %>
                                <br />
                                Is Available: <%#: Item.IsAvailable %>
                                <br />
                                Is Used: <%#: Item.IsUsed %>
                                <br />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

</asp:Content>
