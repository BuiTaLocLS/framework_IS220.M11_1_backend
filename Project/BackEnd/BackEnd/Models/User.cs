using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        [Key]
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UserMail { get; set; }
        [DisplayFormat(DataFormatString = "0:dd/MM/yyyy", ApplyFormatInEditMode = true)]
        public DateTime UserBirthdate { get; set; }
        public Gender? UserGender { get; set; }
        public string UserAddress { get; set; }

        public Account Account { get; set; }
    }
}
