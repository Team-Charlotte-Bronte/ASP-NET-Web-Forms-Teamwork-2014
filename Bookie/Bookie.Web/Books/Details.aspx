<%@ Page Title="Bookie - Book Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Bookie.Web.Books.Details" %>
<asp:Content runat="server" ID="BookDetails" ContentPlaceHolderID="MainContent">
    <asp:FormView class="row jumbotron" ID="BookDetailsView" runat="server" ItemType="Bookie.Models.Book">
                <p>
                    <strong>Founded in:</strong> <span class="pull-right">1968</span>
                </p>
                <p>
                    <strong>Nationality:</strong> <span class="pull-right">Scotland</span>
                </p>
        <asp:FormView runat="server" class="col-md-5 image-container">
            <img  alt="<%#: Item.Name %>" src="<%#: Item.ImageUrl %>">
        </asp:FormView>
    </asp:FormView>
</asp:Content>
