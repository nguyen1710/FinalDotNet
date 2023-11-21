namespace WebApplication1.Models
{
    public class UserAccount
    {
        public  int Id { get; set; }
        public  string email { get; set; }
        public  string password { get; set; }

        public UserAccount(int id, string email, string password) {
            this.password = password;
            this.Id = id;
            this.email= email;
        }
    }
}
