﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Administration/Administration.master"
    AutoEventWireup="true" CodeBehind="UsersPanel.aspx.cs"
    Inherits="Bookie.Web.Account.Administration.UsersPanel" %>
<asp:Content ID="ContentUsers" ContentPlaceHolderID="AdminContent" runat="server">

     <asp:UpdatePanel runat="server" ID="UpdateGridPanel">
        <ContentTemplate>

            <asp:GridView ID="GridViewUsers" runat="server"
                SelectMethod="GridViewUsers_GetData"
                UpdateMethod="GridViewUsers_UpdateItem"
                ItemType="Bookie.Models.User"
                AllowPaging="True"
                PageSize="5"
                AllowSorting="True"
                DataKeyNames="Id"
                AutoGenerateEditButton="true"
                AutoGenerateColumns="false"
                CssClass="table table-hover table-striped">

                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
