<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WingtipToys.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 role="heading" aria-level="2"><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4 role="heading" aria-level="3">Change your account settings</h4>
                <hr aria-hidden="true"/>
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                       <asp:HyperLink NavigateUrl="/Account/ManagePassword"  Text="[Change]" Visible="false" ID="ChangePassword" runat="server" aria-labelledby="change-password-link-hint" area-hidden="true"/>
                        <span id="change-password-link-hint" class="hidden">change password</span>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" aria-labelledby="create-password-link-hint" area-hidden="true"/>
                        <span id="create-password-link-hint" class="hidden">create password</span>
                    </dd>
                    <dt>External Logins:</dt>
                    <dd><%: LoginsCount %>
                        <span id="manage-password-link-hint" class="hidden">manage password</span>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server"  
                            aria-labelledby="manage-password-link-hint"/>
                    </dd>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="http://go.microsoft.com/fwlink/?LinkId=313242">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following block after you have set up two-factor authentication
                    --%>

                    <dt>Phone Number:</dt>
                    <%--
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>Two-Factor Authentication:</dt>
                    <dd>        
                        <p>
                            There are no two-factor authentication providers configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=313242" aria-labelledby="two-factor-authentication-desrc-hint">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.          
                        </p>
                        <span id="two-factor-authentication-desrc-hint" class="hidden">There are no two-factor authentication providers configured. See this article
                            for details on setting up this ASP.NET application to support two-factor authentication. </span>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
