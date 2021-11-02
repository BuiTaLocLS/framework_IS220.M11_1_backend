using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public enum Gender 
    { 
        Male, Female
    }
    public class User
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UserMail { get; set; }
        public DateTime UserBirthdate { get; set; }
        public Gender? UserGender { get; set; }
        public string UserAddress { get; set; }

        public Account Account { get; set; }
    }
}
