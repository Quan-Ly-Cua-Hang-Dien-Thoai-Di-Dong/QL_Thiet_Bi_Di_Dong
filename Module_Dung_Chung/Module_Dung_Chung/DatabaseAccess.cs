using System;
using System.Data;
using System.Data.SqlClient;

namespace Module_Dung_Chung
{
    public class DatabaseAccess
    {
        #region Hàm Dùng Chung

        protected SqlConnection conn;

        protected DataSet dataSet;

        /// <summary>
        ///     Hàm này dùng để tạo mới 1 DataSet
        /// </summary>
        protected void createdataSet()
        {
            dataSet = new DataSet();
        }

        /// <summary>
        ///     Hàm này dùng để mở Connection (nếu Connection bị đóng)
        /// </summary>
        protected void openConnected()
        {
            if (conn.State == ConnectionState.Closed) conn.Open();
        }

        /// <summary>
        ///     Hàm này dùng để đọc bảng trong DataSet
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        protected DataTable reaDataTableInDataSet(string tableName)
        {
            return dataSet.Tables[tableName];
        }
        /// <summary>
        ///     Hàm này giúp cập nhật lại Table trong DataSet (dùng trong môi trg disconnected)
        ///     Trước khi dùng hàm này dùng hàm addTableInDataSet trước.
        ///     Truyền vào SqlDataAdapter đã chứa SqlCommand hoặc không.
        /// </summary>
        /// <param name="adapter"></param>
        /// <param name="tableName"></param>
        protected void updateTableInDataSet(SqlDataAdapter adapter, string tableName)
        {
            SqlCommandBuilder cmdBuilder = new SqlCommandBuilder(adapter);
            adapter.Update(dataSet.Tables[tableName]);
        }

        /// <summary>
        ///     Hàm này thêm 1 table (dùng lệnh Store Procedure có thể truyền parameter) vào DataSet sau đó gọi readDataTableInDataSet để đọc dữ liệu .
        ///     Trước khi dùng hàm này dùng hàm openConnected() trước.
        ///     Truyền vào SqlDataAdapter đã chứa SqlCommand hoặc không.
        /// </summary>
        /// <param name="adapter"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        protected bool addTableInDataSet(SqlDataAdapter adapter, string tableName)
        {
            try
            {
                adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                adapter.Fill(dataSet, tableName);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        ///     Hàm này dùng Store Procedure đọc tất cả dự liệu bao gồm (cả truyền Parameter).
        ///     Trước khi dùng hàm này dùng hàm openConnected() trước.
        ///     Truyền vào SqlCommand đã chứa Parameters hoặc không.
        /// </summary>
        /// <param name="pQuery"></param>
        /// <returns></returns>
        protected DataTable readListByDataReader(SqlCommand cmd)
        {
            var rd = cmd.ExecuteReader();
            var dt = new DataTable();
            if (rd.HasRows) dt.Load(rd);
            closeConnected();
            return dt;
        }

        /// <summary>
        ///     Hàm này dùng Store Procedure được áp dụng cho: Insert, Update, Delete.
        ///     Trước khi dùng hàm này phải dùng hàm openConnected() trước.
        ///     Truyền vào SqlCommand đã chứa Parameters.
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns></returns>
        protected bool excuteNoneQueryByCommand(SqlCommand cmd)
        {
            var kq = cmd.ExecuteNonQuery();
            closeConnected();
            return kq > 0;
        }

        /// <summary>
        ///     Hàm này dùng để đóng Connection (nếu Connection chưa bị đóng)
        /// </summary>
        private void closeConnected()
        {
            if (conn != null || conn.State == ConnectionState.Open) conn.Close();
        }

        /// <summary>
        ///     Hàm Kiểm Tra Cấu Hình
        /// </summary>
        /// <param name="setting"></param>
        /// <returns>
        ///     0 : Kết nối thành công chuỗi cấu hình hợp lệ.
        ///     1 : Chuỗi cấu hình không tồn tại.
        ///     2 : Chuỗi cấu hình không phù hợp.
        /// </returns>
        protected int checkConfig(string setting)
        {
            if (setting == string.Empty)
                return 1;
            conn = new SqlConnection(setting);
            try
            {
                openConnected();
                return 0;
            }
            catch
            {
                return 2;
            }
        }

        #endregion Hàm Dùng Chung
    }
}