<%@ Page Title="Bookie - Lastest Books" Language="C#" AutoEventWireup="true"
MasterPageFile="~/Site.Master" 
CodeBehind="Books.aspx.cs" 
Inherits="Bookie.Web.Latest.Books" %>

<%@ OutputCache CacheProfile="ShortLived" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <asp:ListView ID="LatestBooks" runat="server" ItemType="Bookie.Models.Book" DataKeyNames="Id" InsertItemPosition="None">
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
                <div class="text-center books-pager">
                    <asp:DataPager ID="BookieDataPager" runat="server" PageSize="8" QueryStringField="page">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="False"
                                                        ShowNextPageButton="False" ShowPreviousPageButton="True" PreviousPageText="Previous Page"  />
                            <asp:NumericPagerField NumericButtonCssClass="page-label" NextPreviousButtonCssClass="page-label" CurrentPageLabelCssClass="page-label" />
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="False" 
                                                        ShowNextPageButton="True" ShowPreviousPageButton="False" NextPageText="Next Page" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>

            <EmptyDataTemplate>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>There where no new books added in the last hour</h2>
                    </div>
                </div>
            </EmptyDataTemplate>

            <ItemTemplate>
                <div class="col-md-3 text-center">
                    <div class="well">
                        <a href="/Books/Details?book=<%#: Item.Id %>" title="See book's details">
                            <img src="<%#: Item.ImageUrl %>" />
                        </a>
                        <div class="text-left">
                            <div><%#: Item.Name %></div>
                            <div>
                                <strong><%#: Item.Publisher.Name %></strong>
                            </div>
                            <div>Price: $<%#: Item.Price %></div>
                        </div>

                        <a href="/Books/Details?book=<%#: Item.Id %>" class="btn btn-info btn-sm btn-block" title="See book's details">
                            See Details
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>