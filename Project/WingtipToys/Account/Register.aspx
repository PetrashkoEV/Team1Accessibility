<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WingtipToys.Account.Register"%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2 role="heading" aria-level="1" aria-label="Registration form"><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4 role="heading" aria-level="2" id="register-desc">Create a new account</h4>
        <hr aria-hidden="true" />
        <div aria-live="polite">
            <asp:ValidationSummary runat="server" ID="validationSummary" CssClass="text-danger non-focusable" HeaderText="One or more errors have occurred when attempting to create your account."/>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" runat="server" aria-invalid="false" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" aria-hidden="true" ID="emailValidator" CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" runat="server" aria-invalid="false" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ID="passwordValidator" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." />
                <asp:CustomValidator ID="passowrdComplexityValidator" runat="server" OnServerValidate="CheckPasswordComplexity" ControlToValidate="Password" Display="Dynamic" CssClass="text-danger" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" runat="server" ID="ConfirmPassword" aria-invalid="false" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" aria-hidden="true" ControlToValidate="ConfirmPassword" ID="confirmRequiredValidator" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ID="confirmCompareValidator" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default"/>
            </div>
        </div>
    </div>
    <script src="../Scripts/customValidation.js" type="text/javascript"></script>
</asp:Content>

