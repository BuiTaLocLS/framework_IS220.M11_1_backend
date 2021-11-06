using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class SearchHistory
    {
        [Key]
        public int SearchHistoryID { get; set; }
        public string AccountID { get; set; }
        [ForeignKey("AccountID")]
        public string SearchContent { get; set; }
        [DisplayFormat(DataFormatString = "0:dd/MM/yyyy", ApplyFormatInEditMode = true)]
        public DateTime SearchDate { get; set; }
        public Account Account { get; set; }
    }
}
