using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Thiet_Bi_Di_Dong_DTO
{
    public class KhachHang
    {
        public int MaKH { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public DateTime BirthDay { get; set; }
        public string Sex { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public bool Status { get; set; }
    }
}
