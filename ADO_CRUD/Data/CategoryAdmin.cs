using ADO_CRUD.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ADO_CRUD.Data
{
    public class CategoryAdmin: Connection
    {
        public IEnumerable<CategoryModel> GetCategories()
        {
            Connect();
            List<CategoryModel> list = new List<CategoryModel>();
            try
            {
                SqlCommand command = new SqlCommand("sp_category_get_list", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    CategoryModel model = new CategoryModel()
                    {
                        Id = int.Parse(reader[0].ToString()),
                        Name = reader[1]+""
                    };
                    list.Add(model);
                }
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
            return list;
        }

        public CategoryModel GetById(int Id)
        {
            Connect();
            CategoryModel list = new CategoryModel();
            try
            {
                SqlCommand command = new SqlCommand("sp_category_get_id", cnn);
                command.Parameters.AddWithValue("@ID", Id);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    list = new CategoryModel()
                    {
                        Id = int.Parse(reader[0].ToString()),
                        Name = reader[1].ToString()
                    };
                }
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
            return list;
        }

        public Boolean SaveCategories(CategoryModel model)
        {
            Connect();
            try
            {
                SqlCommand command = new SqlCommand("sp_category_create", cnn);
                command.CommandType=System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@NAME", model.Name);
                command.ExecuteNonQuery();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
                return false;
            }
            finally
            {
                Disconnect();
            }
            return true;
        }

        public Boolean EditCategory(CategoryModel model)
        {
            Connect();
            try
            {
                SqlCommand command = new SqlCommand("sp_category_edit", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", model.Id);
                command.Parameters.AddWithValue("@Name", model.Name);
                command.ExecuteNonQuery();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
                return false;
            }
            finally
            {
                Disconnect();
            }
            return true;
        }

        public Boolean DeleteCategory(CategoryModel model)
        {
            Connect();
            try
            {
                SqlCommand command = new SqlCommand("sp_category_delete", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", model.Id);
                command.ExecuteNonQuery();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
                return false;
            }
            finally
            {
                Disconnect();
            }
            return true;
        }

        public Boolean DetailsCategory(ProductModel model)
        {
            Connect();
            try
            {
                SqlCommand command = new SqlCommand("sp_product_search", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", model.ID);
                command.Parameters.AddWithValue("@Name", model.Name);
                command.Parameters.AddWithValue("@Description", model.Description);
                command.Parameters.AddWithValue("@URL_IMG", model.URL_IMG);
                command.Parameters.AddWithValue("@ID_Category", model.ID_Category);
                command.ExecuteNonQuery();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
                return false;
            }
            finally
            {
                Disconnect();
            }

            return true;
        }
    }
}