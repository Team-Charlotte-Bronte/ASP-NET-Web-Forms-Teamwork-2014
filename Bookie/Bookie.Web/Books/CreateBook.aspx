<%@ Page Title="Create Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CreateBook.aspx.cs" Inherits="Bookie.Web.Books.CreateBook" %>

<asp:Content runat="server" ID="CreateBookContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new book</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CatalogNumber" CssClass="col-md-2 control-label">Catalog number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CatalogNumber" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The catalog number field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownListCategories" CssClass="col-md-2 control-label">Category</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownListCategories" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownListCategories_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownListSubCategories" CssClass="col-md-2 control-label">Subcategory</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownListSubCategories" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Publisher" CssClass="col-md-2 control-label">Publisher</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Publisher" CssClass="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Publisher"
                        CssClass="text-danger" ErrorMessage="The publisher field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Isbn" CssClass="col-md-2 control-label">Isbn</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Isbn" CssClass="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Isbn"
                        CssClass="text-danger" ErrorMessage="The Isbn number field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Description" CssClass="form-control" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Description"
                        CssClass="text-danger" ErrorMessage="The description field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="AuthorComment" CssClass="col-md-2 control-label">Author comment</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="AuthorComment" CssClass="form-control" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="AuthorComment"
                        CssClass="text-danger" ErrorMessage="The author comment field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NumberOfPages" CssClass="col-md-2 control-label">Number of pages</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="NumberOfPages" CssClass="form-control" TextMode="Number" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Year" CssClass="col-md-2 control-label">Year</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Year" CssClass="form-control" TextMode="Number" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Price" CssClass="col-md-2 control-label">Price</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Price" CssClass="form-control" TextMode="Number" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Price"
                        CssClass="text-danger" ErrorMessage="The price field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="IsUsed" CssClass="col-md-2 control-label">Used</asp:Label>
                <div class="col-md-10">
                    <asp:CheckBox runat="server" ID="IsUsed" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Image" CssClass="col-md-2 control-label">Front cover</asp:Label>
                <div class="col-md-10">
                    <asp:FileUpload ID="Image" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="CreateBook_Click" Text="Create Book" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
</asp:Content>
