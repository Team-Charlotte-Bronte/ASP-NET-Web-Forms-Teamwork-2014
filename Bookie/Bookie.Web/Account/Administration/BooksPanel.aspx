<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Administration/Administration.master"
    AutoEventWireup="true" CodeBehind="BooksPanel.aspx.cs"
    Inherits="Bookie.Web.Account.Administration.BooksPanel" %>

<asp:Content ID="ContentBooks" ContentPlaceHolderID="AdminContent" runat="server">

    <asp:UpdatePanel runat="server" ID="UpdateGridPanel">
        <ContentTemplate>

            <asp:GridView ID="GridViewBooks" runat="server"
                SelectMethod="GridViewBooks_GetData"
                UpdateMethod="GridViewBooks_UpdateItem"
                ItemType="Bookie.Models.Book"
                AllowPaging="True"
                PageSize="5"
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label Text="" runat="server" ID="LabelId" />

    <asp:UpdatePanel runat="server" ID="UpdatePanelForm">
        <ContentTemplate>
    <asp:FormView runat="server" ID="FormViewDetails"
        ItemType="Bookie.Models.Book"
        DataKeyNames="Id" OnModeChanging="FormViewDetails_ModeChanging">
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
                    <%--<asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" Text="Edit" />--%>
                </div>
            </div>
        </ItemTemplate>
        <%--<EditItemTemplate>
             <div class="list-group">
                <div class="list-group-item">
                    <strong>Title:</strong> <asp:TextBox ID="TextBoxName" runat="server" Text='<%#: BindItem.Name %>' />
                    <br />
                    <strong>ISBN:</strong> <asp:TextBox ID="TextBoxISBN" runat="server" Text='<%#: BindItem.Isbn %>' />
                    <br />
                    <strong>Year:</strong> <asp:TextBox ID="TextBoxYear" runat="server" Text='<%#: BindItem.Year %>' />
                    <br />
                    <strong>Pages:</strong> <asp:TextBox ID="TextBoxNumberOfPages" runat="server" Text='<%#: BindItem.NumberOfPages %>' />
                    <br />
                    <strong>Category:</strong> <asp:TextBox ID="TextBoxCategory" runat="server" Text='<%#: BindItem.Category %>' />
                    <br />
                    <strong>Subcategory:</strong> <asp:TextBox ID="TextBoxSubcategory" runat="server" Text='<%#: BindItem.Name %>' />
                    <br />
                    <strong>Price:</strong> <asp:TextBox ID="TextBoxPrice" runat="server" Text='<%#: BindItem.Price %>' />
                    <br />
                    <strong>Description:</strong> <asp:TextBox ID="TextBoxDescription" runat="server" Text='<%#: BindItem.Description %>' />
                    <br />
                    <strong>Publisher:</strong> <asp:TextBox ID="TextBoxPublisher" runat="server" Text='<%#: BindItem.Publisher.Name %>' />
                    <br />
                    <strong>Is Approved:</strong> <asp:TextBox ID="TextBoxApproved" runat="server" Text='<%#: BindItem.IsApproved %>' />
                    <br />
                    <strong>Is Available:</strong> <asp:TextBox ID="TextBox1" runat="server" Text='<%#: BindItem.IsAvailable %>' />
                    <br />
                    <strong>Is Used:</strong> <asp:TextBox ID="TextBox2" runat="server" Text='<%#: BindItem.IsUsed %>' />

                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                </div>
            </div>
        </EditItemTemplate>--%>
    </asp:FormView>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
