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

        [StringLength(50, ErrorMessage = "Không vượt quá 50 kí tự!")]
        public string UserName { get; set; }

        [StringLength(40, ErrorMessage = "Không vượt quá 40 kí tự!")]
        public string UserMail { get; set; }

        [DisplayFormat(DataFormatString = "0:dd/MM/yyyy", ApplyFormatInEditMode = true)]
        public DateTime UserBirthdate { get; set; }

        public Gender? UserGender { get; set; }

        [StringLength(60, ErrorMessage = "Không vượt quá 60 kí tự!")]
        public string UserAddress { get; set; }

        public Account Account { get; set; }
    }
}
