using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ADO_CRUD.Models
{
    public class ProductModel
    {
        [Required]
        public int ID { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string URL_IMG { get; set; }
        [Required]
        public int ID_Category { get; set; }
        public bool Enabled { get; set; }
        public DateTime Created { get; set; }
        public CategoryModel category { get; set; }
    }
}