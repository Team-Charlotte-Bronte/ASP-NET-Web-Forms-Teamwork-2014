<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Administration/Administration.master"
    AutoEventWireup="true"
    CodeBehind="AdminPanel.aspx.cs"
    Inherits="Bookie.Web.Account.Administration.AdminPanel" %>

<asp:Content ID="ContentAdminPanel" ContentPlaceHolderID="AdminContent" runat="server">

    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Assets</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <span class="badge">
                                    <asp:Literal runat="server" ID="LiteralUsersCount" />
                                </span>
                                <a href="UsersPanel.aspx">Users</a>
                            </li>
                            <li class="list-group-item">
                                <span class="badge">
                                    <asp:Literal runat="server" ID="LiteralBooksCount" />
                                </span>
                                <a href="BooksPanel.aspx">Books</a>
                            </li>
                            <li class="list-group-item">
                                <span class="badge">
                                    <asp:Literal runat="server" ID="LiteralCommentsCount" />
                                </span>
                                <a href="CommentsPanel.aspx">Comments</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Pending Approval</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <span class="badge">
                                    <asp:Literal runat="server" ID="LiteralPendingBooks" />
                                </span>
                                <a href="BooksApprove.aspx">Pending books</a>
                            </li>
                            <li class="list-group-item">
                                <span class="badge">
                                    <asp:Literal runat="server" ID="LiteralPendingComments" />
                                </span>
                                <a href="CommentsApproval.aspx">Pending comments</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
