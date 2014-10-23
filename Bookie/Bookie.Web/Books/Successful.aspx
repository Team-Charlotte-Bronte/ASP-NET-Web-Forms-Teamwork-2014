<%@ Page Title="Bookie - Success publication" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Successful.aspx.cs" Inherits="Bookie.Web.Books.Successful" %>
<asp:Content ID="NewBookContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 style="color: green">You successfully published a new book!</h1>
            <h3>Your publication will be viewed from administrator and after approval the book will be shown to the web-site...</h3>
        </div>
    </div>
    
    <br />

    <div class="row">
        <div class="col-md-12 text-center">
            <a class="btn btn-default btn-lg" href="/">Back to Home Page</a>
        </div>
    </div>
</asp:Content>
