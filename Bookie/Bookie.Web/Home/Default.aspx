<%@ Page Title="Bookie - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bookie.Web.Home._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:ListView ID="BooksListView" runat="server" ItemType="Bookie.Models.Book" DataKeyNames="Id" InsertItemPosition="None">
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
                <div class="text-center books-pager">
                    <asp:DataPager ID="BookieDataPager" runat="server" PageSize="8" QueryStringField="page">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-primary" ShowFirstPageButton="False" 
                                                        ShowNextPageButton="False" ShowPreviousPageButton="True" PreviousPageText="Previous Page"  />
                            <asp:NumericPagerField NumericButtonCssClass="page-label" NextPreviousButtonCssClass="page-label" CurrentPageLabelCssClass="page-label" />
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-primary" ShowLastPageButton="False" 
                                                        ShowNextPageButton="True" ShowPreviousPageButton="False" NextPageText="Next Page" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>

            <EmptyDataTemplate>
                <div>No data was returned.</div>
            </EmptyDataTemplate>

            <ItemTemplate>
                <div class="col-md-3 text-center">
                    <div class="well">
                        <img src="<%#: Item.ImageUrl %>" />
                        <div class="text-left">
                            <div>Title: <%#: Item.Name %></div>
                            <div>
                                Publisher: <strong><%#: Item.Publisher.Name %></strong>
                            </div>
                            <div>Price: $<%#: Item.Price %></div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
