<%@ Page Title="Bookie - Book Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Bookie.Web.Books.Details" %>
<asp:Content runat="server" ID="BookDetails" ContentPlaceHolderID="MainContent">
    <asp:FormView  ID="BookDetailsView" 
                  runat="server" ItemType="Bookie.Models.Book">
        <ItemTemplate>
            <div class="row jumbotron">
            <div class="container">
                <div class="col-md-7">
                    <h2 class="ng-binding"><%#: Item.Name %></h2>
                    <div>
                        <p>
                            <strong>Description:</strong> <%#: Item.Description %>
                        </p>
                        <p>
                            <strong>Author Comments:</strong> <%#: Item.AuthorComment %>
                        </p>
                        <p>
                            <strong>Year:</strong> <%#: Item.Year %>
                        </p>
                        <p>
                            <strong>Available </strong> <%#: Item.IsAvailable %>
                        </p>
                        <p>
                            <strong>Price:</strong> <%#: Item.Price %>
                        </p>
                        <div class="clearfix"></div>
                        <p></p>
                    </div>
                </div>
                <div class="col-md-5 image-container">
                    <img  alt="<%#: Item.Name %>" src="<%#: Item.ImageUrl %>">
                </div>
            </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
