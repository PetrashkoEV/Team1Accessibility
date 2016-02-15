using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;

namespace WingtipToys.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
                IdentityResult result = manager.Create(user, Password.Text);

                if (result.Succeeded)
                {
                    IdentityHelper.SignIn(manager, user, isPersistent: false);

                    using (WingtipToys.Logic.ShoppingCartActions usersShoppingCart = new WingtipToys.Logic.ShoppingCartActions())
                    {
                        String cartId = usersShoppingCart.GetCartId();
                        usersShoppingCart.MigrateCart(cartId, user.Id);
                    }

                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
            }
        }

        protected void CheckPasswordComplexity(object source, ServerValidateEventArgs arg)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var validationTask = manager.PasswordValidator.ValidateAsync(arg.Value);
            validationTask.Wait();

            var validationResult = validationTask.Result;
            var validator = source as CustomValidator;

            arg.IsValid = validationResult.Succeeded;

            if (validator != null && !validationResult.Succeeded)
            {
                validator.Text = validationResult.Errors.FirstOrDefault();
                Password.Attributes.Add("aria-describedby", validator.ClientID);
                Password.Attributes.Add("aria-invalid", "true");
                validationSummary.Focus();
            }
        }
    }
}