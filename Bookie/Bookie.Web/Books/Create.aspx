<%@ Page Title="Create Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Create.aspx.cs" Inherits="Bookie.Web.Books.CreateBook" %>

<asp:Content runat="server" ID="CreateBookContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal col-md-8">
        <h4>Create a new book</h4>
        <hr />
       <%-- <asp:ValidationSummary runat="server" CssClass="text-danger" />--%>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-3 control-label">Book's title</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Name" Placeholder="Enter a book's title (required)" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="Please enter a book's title!" />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Image" CssClass="col-md-3 control-label">Cover</asp:Label>
            <div class="col-md-9">
                <asp:FileUpload ID="Image" runat="server" CssClass="form-control" accept="image/*" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Image"
                    CssClass="text-danger" ErrorMessage="Please upload an book's cover image!" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownListCategories" CssClass="col-md-3 control-label">Category</asp:Label>
            <div class="col-md-9">
                <asp:DropDownList ID="DropDownListCategories" runat="server" CssClass="form-control" OnSelectedIndexChanged="OnDropDownListCategoriesSelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group" runat="server" id="SubCategoriesDropDownContainer">
            <asp:Label runat="server" AssociatedControlID="DropDownListSubCategories" CssClass="col-md-3 control-label">Subcategory</asp:Label>
            <div class="col-md-9">
                <asp:DropDownList ID="DropDownListSubCategories" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Publisher" CssClass="col-md-3 control-label">Publisher</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Publisher" CssClass="form-control" Placeholder="Enter a publisher (required)" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Publisher"
                    CssClass="text-danger" ErrorMessage="Please specify publisher of the book!" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Price" CssClass="col-md-3 control-label">Price</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Price" CssClass="form-control" Placeholder="Enter a price of the book (required)" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Price"
                    CssClass="text-danger" ErrorMessage="Please specify price of the book!" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="IsUsed" CssClass="col-md-3 control-label">Is used</asp:Label>
            <div class="col-md-9">
                <div class="form-control small-text">
                    <label>
                        <asp:CheckBox runat="server" ID="IsUsed" />
                        <em>
                            <small>*Specify if the book is new or already used</small>
                        </em>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Isbn" CssClass="col-md-3 control-label">ISBN</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Isbn" CssClass="form-control" Placeholder="Enter an ISBN of the book (optional)" TextMode="SingleLine" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-3 control-label">Description</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Description" CssClass="form-control" Placeholder="Enter a book's description (optional)" TextMode="MultiLine" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AuthorComment" CssClass="col-md-3 control-label">Comment about book</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="AuthorComment" CssClass="form-control" Placeholder="Left some comment about the book or delivery (optional)" TextMode="MultiLine" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NumberOfPages" CssClass="col-md-3 control-label">Pages</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="NumberOfPages" CssClass="form-control" Placeholder="Enter a number of book's pages (optional)" TextMode="Number" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Year" CssClass="col-md-3 control-label">Year of release</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="Year" CssClass="form-control" Placeholder="Enter a book's release year (optional)" TextMode="Number" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-3 col-md-9">
                <asp:Button runat="server" OnClick="OnCreateBookButtonClicked" Text="Create Book" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
