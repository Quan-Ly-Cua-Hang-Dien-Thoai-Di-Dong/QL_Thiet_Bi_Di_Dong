using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Thiet_Bi_Di_Dong_DTO
{
    public class DonHang
    {
        public int MaDH { get; set; }
        public int MaKH { get; set; }
        public DateTime NgayGiao { get; set; }
        public DateTime NgayDat { get; set; }
        public bool DaThanhToan { get; set; }
        public bool TinhTrangGiaoHang { get; set; }
    }
}
