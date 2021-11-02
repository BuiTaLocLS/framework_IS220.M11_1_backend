using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class SearchHistory
    {
        public int SearchHistoryID { get; set; }
        public string AccountID { get; set; }
        public string SearchContent { get; set; }
        public DateTime SearchDate { get; set; }
        public Account Account { get; set; }
    }
}
