using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MVC_EF_DBFirst.ViewModels
{
    public class CustomerOrdersViewModel
    {
        public int CustomerID { get; set; }
        [Required(ErrorMessage = "Please Enter your Customer Name")]
        public string CustomerName { get; set; }
        [Required(ErrorMessage ="Please Enter your Contact Number")]
        public string ContactNumber { get; set; }

        public int OrderID { get; set; }

        [Required(ErrorMessage = "Please Select Order Date")]
        public DateTime OrderDate { get; set; }
        
        public List<CustomerOrdersViewModel> customerList { get; set; }
    }
}