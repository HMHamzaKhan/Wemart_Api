using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Wemart.SQL
{
    public class Connection
    {

        private static Connection _instance;

        private Connection() { }

        public static Connection Instance { get => _instance = _instance ?? new Connection(); }

        public static string MsSQLConnectionString { get; set; }

        public SqlConnection conn = new SqlConnection(MsSQLConnectionString);

        public void OpenConn()
        {
            conn.Open();
        }

        public void CloseConn()
        {
            conn.Close();
        }

        public async Task<bool> AddOrUpdateTblAsync(Dictionary<String, Object> Params, string query, bool isStoredProcedure = false)
        {
            try
            {
                OpenConn();
                SqlCommand sc = new SqlCommand(query, conn);
                if (isStoredProcedure)
                {
                    sc.CommandType = CommandType.StoredProcedure;
                }

                foreach (var parameter in Params)
                {
                    sc.Parameters.AddWithValue(parameter.Key, parameter.Value);
                }


                lock (conn)
                {
                    if (sc.ExecuteNonQuery() > 0)
                    {
                        CloseConn();
                        return true;
                    }
                }

                //  CloseConn();
                return false;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                CloseConn();
            }

        }

        public async Task<DataTable> GetDataAsync(string query, Dictionary<String, Object> Params = null, bool isStoredProcedure = false)
        {
            DataTable dt = new DataTable();
            try
            {

                OpenConn();
                SqlCommand sc = new SqlCommand(query, conn);

                if (isStoredProcedure)
                {
                    sc.CommandType = CommandType.StoredProcedure;
                }

                if (Params != null)
                {
                    foreach (var parameter in Params)
                    {
                        sc.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }
                }


                lock (conn)
                {
                    using (SqlDataReader sdr = sc.ExecuteReader())
                    {
                        dt.Load(sdr);
                    }
                }
                //CloseConn();
                return dt;
            }
            catch (Exception ex)
            {
                // CloseConn();
                return dt;

            }
            finally
            {
                CloseConn();
            }

        }



        public async Task<DataSet> GetDataSetAsync(string query, Dictionary<String, Object> Params = null, bool isStoredProcedure = false)
        {
            DataSet ds = new DataSet();
            try
            {

                OpenConn();
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);

                if (Params != null)
                {
                    foreach (var parameter in Params)
                    {
                        sda.SelectCommand.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }
                }

                if (isStoredProcedure)
                {
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                }

                lock (conn)
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                return ds;
            }
            finally
            {
                CloseConn();
            }
        }



        public async Task<bool> CheckDataAsync(string query, Dictionary<String, Object> Params = null, bool isStoredProcedure = false)
        {
            try
            {

                OpenConn();
                SqlCommand sc = new SqlCommand(query, conn);

                if (isStoredProcedure)
                {
                    sc.CommandType = CommandType.StoredProcedure;
                }

                if (Params != null)
                {
                    foreach (var parameter in Params)
                    {
                        sc.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }
                }


                lock (conn)
                {
                    using (SqlDataReader sdr = sc.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            CloseConn();
                            return true;
                        }
                    }

                }
                //CloseConn();

                return false;
            }
            catch (Exception ex)
            {

                return false;

            }
            finally
            {
                CloseConn();
            }

        }

        public async Task<int> GetNextIDAsync(string tablename)
        {
            var dt = await GetDataAsync("select isnull(max(ID),0)+1 from " + tablename.Trim());
            return Convert.ToInt32(dt.Rows[0][0]);
        }


        public async Task<List<T>> ToCollectionAsync<T>(DataTable dt)
        {
            List<T> list = new System.Collections.Generic.List<T>();
            Type model = typeof(T);
            PropertyInfo[] datatypes = model.GetProperties();
            List<DataColumn> dtColumns = dt.Columns.Cast<DataColumn>().ToList();
            T cn;
            foreach (DataRow item in dt.Rows)
            {
                cn = (T)Activator.CreateInstance(model);
                foreach (PropertyInfo pc in datatypes)
                {

                    try
                    {
                        DataColumn dataColumn = dtColumns.Find(col => col.ColumnName == pc.Name);
                        if (dataColumn != null)
                            pc.SetValue(cn, item[pc.Name], null);
                    }
                    catch
                    {
                    }
                }
                list.Add(cn);
            }
            return list;
        }

        public async Task<T> GetObjectAsync<T>(DataRow row) where T : new()
        {


            T item = new T();
            foreach (DataColumn c in row.Table.Columns)
            {

                PropertyInfo p = item.GetType().GetProperty(c.ColumnName);

                if (p != null && row[c] != DBNull.Value)
                {
                    if (c.DataType == typeof(decimal))
                    {
                        double convertedValue = Convert.ToDouble(row[c]);
                        p.SetValue(item, convertedValue, null);
                    }
                    else
                    {
                        p.SetValue(item, row[c], null);
                    }

                }
            }

            return item;
        }


    }
}