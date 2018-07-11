using MVC_EF_DBFirst.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_EF_DBFirst.ViewModels
{
    public class TPTEmployeeViewModel
    {
        public List<ContractVM> ContractTPTEmployees { get; set; }
        public List<PermanentVM> PermanentTPTEmployees { get; set; }

        public List<TPTFullEmployeeViewModel> tptFullEmployeeViewModel { get; set; }
    }
    public class TPTFullEmployeeViewModel
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }

        public Nullable<int> HourlyPay { get; set; }
        public Nullable<int> HoursWorked { get; set; }
        public Nullable<int> AnnualSalary { get; set; }
    }


    public class ContractVM:EmployeeVM
    {
        public Nullable<int> HourlyPay { get; set; }
        public Nullable<int> HoursWorked { get; set; }
    }

    public class PermanentVM : EmployeeVM
    {
        public Nullable<int> AnnualSalary { get; set; }
    }

    public class EmployeeVM
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
    }

}