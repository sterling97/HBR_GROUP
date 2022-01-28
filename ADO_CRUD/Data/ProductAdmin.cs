//using ADO_CRUD.Models;
//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using ADO_CRUD;
//using DataAccess;

//namespace ADO_CRUD.Data
//{
//    public class ProductAdmin: ConnectionDB
//    {
//        public IEnumerable<ProductModel> Consultar()
//        {
//            Connect();
//            List<ProductModel> list = new List<ProductModel>();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_get_list", cnn);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                SqlDataReader reader = command.ExecuteReader();
//                while (reader.Read())
//                {
//                    ProductModel model = new ProductModel()
//                    {
//                        ID = int.Parse(reader[0].ToString()),
//                        Name = reader[1].ToString(),
//                        Description = reader[2].ToString(),
//                        URL_IMG = reader[3].ToString(),
//                        ID_Category = int.Parse(reader[4].ToString()),
//                        category = new CategoryModel() { Name = reader[7].ToString() }
//                    };
//                    list.Add(model);
//                }
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//            }
//            finally
//            {
//                Disconnect();
//            }
//            return list;
//        }

//        public IEnumerable<ProductModel> SearchProduct(string keyword)
//        {
//            Connect();
//            List<ProductModel> list = new List<ProductModel>();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_search", cnn);
//                command.Parameters.AddWithValue("@KEYWORD", keyword);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                SqlDataReader reader = command.ExecuteReader();
//                while (reader.Read())
//                {
//                    ProductModel model = new ProductModel()
//                    {
//                        ID = int.Parse(reader[0].ToString()),
//                        Name = reader[1].ToString(),
//                        Description = reader[2].ToString()
//                    };
//                    list.Add(model);
//                }
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//            }
//            finally
//            {
//                Disconnect();
//            }
//            return list;
//        }

//        public ProductModel GetById( int Id )
//        {
//            Connect();
//            ProductModel list = new ProductModel();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_get_id", cnn);
//                command.Parameters.AddWithValue("@Id", Id);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                SqlDataReader reader = command.ExecuteReader();
//                while (reader.Read())
//                {
//                    list = new ProductModel()
//                    {
//                        ID = int.Parse(reader[0].ToString()),
//                        Name = reader[1].ToString(),
//                        Description = reader[2].ToString(),
//                        URL_IMG = reader[3].ToString(),
//                        ID_Category = int.Parse(reader[4].ToString()),
//                        category = new CategoryModel() { Name = reader[7].ToString() }
//                    };
//                }
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//            }
//            finally
//            {
//                Disconnect();
//            }
//            return list;
//        }

//        public Boolean SaveProduct(ProductModel model)
//        {
//            Connect();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_create", cnn);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                command.Parameters.AddWithValue("@Name", model.Name);
//                command.Parameters.AddWithValue("@Description", model.Description);
//                command.Parameters.AddWithValue("@URL_IMG", model.URL_IMG);
//                command.Parameters.AddWithValue("@ID_Category", model.ID_Category);
//                command.ExecuteNonQuery();
//            }
//            catch (Exception e)
//            {
//                Console.WriteLine(e.StackTrace);
//                return false;
//            }
//            finally
//            {
//                Disconnect();
//            }

//            return true;
//        }
        
//        public Boolean EditProduct(ProductModel model)
//        {
//            Connect();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_edit", cnn);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                command.Parameters.AddWithValue("@ID", model.ID);
//                command.Parameters.AddWithValue("@Name", model.Name);
//                command.Parameters.AddWithValue("@Description", model.Description);
//                command.Parameters.AddWithValue("@URL_IMG", model.URL_IMG);
//                command.Parameters.AddWithValue("@ID_Category", model.ID_Category);
//                command.ExecuteNonQuery();
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//                return false;
//            }
//            finally
//            {
//                Disconnect();
//            }

//            return true;
//        }

//        public Boolean DeleteProduct(ProductModel model)
//        {
//            Connect();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_products_delete", cnn);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                command.Parameters.AddWithValue("@ID", model.ID);
//                command.ExecuteNonQuery();
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//                return false;
//            }
//            finally
//            {
//                Disconnect();
//            }
//            return true;
//        }

//        public Boolean DetailsProduct(ProductModel model)
//        {
//            Connect();
//            try
//            {
//                SqlCommand command = new SqlCommand("sp_product_search", cnn);
//                command.CommandType = System.Data.CommandType.StoredProcedure;
//                command.Parameters.AddWithValue("@ID", model.ID);
//                command.Parameters.AddWithValue("@Name", model.Name);
//                command.Parameters.AddWithValue("@Description", model.Description);
//                command.Parameters.AddWithValue("@URL_IMG", model.URL_IMG);
//                command.Parameters.AddWithValue("@ID_Category", model.ID_Category);
//                command.ExecuteNonQuery();
//            }
//            catch (Exception e)
//            {

//                Console.WriteLine(e.StackTrace);
//                return false;
//            }
//            finally
//            {
//                Disconnect();
//            }

//            return true;
//        }

//    }
//}