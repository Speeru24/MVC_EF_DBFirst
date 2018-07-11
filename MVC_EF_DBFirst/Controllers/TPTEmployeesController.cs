using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC_EF_DBFirst.ViewModels;
using MVC_EF_DBFirst.Models;
using AutoMapper;

namespace MVC_EF_DBFirst.Controllers
{
    public class TPTEmployeesController : Controller
    {
        private EF_DBFirstEntities1 db = new EF_DBFirstEntities1();


        // GET: TPTEmployees
        public ActionResult Index()
        {
            TPTEmployeeViewModel tptViewModel = new TPTEmployeeViewModel();

            //Get data from Database
            var CE = db.ContractTPTEmployees.ToList();
            var PE = db.PermanentTPTEmployees.ToList();

            //Convert List of ContractTPTEmployees to ContractVM
            var targetCEList = CE
                             .Select(x => new ContractVM() { EmployeeID = x.TPTEmployee.EmployeeID, FirstName = x.TPTEmployee.FirstName, LastName = x.TPTEmployee.LastName, Gender = x.TPTEmployee.Gender, HourlyPay = x.HourlyPay, HoursWorked = x.HoursWorked })
                             .ToList();

            tptViewModel.ContractTPTEmployees = targetCEList;


            //Convert List of PermanentTPTEmployees to PermanentVM
            var targetPEList = PE
                             .Select(x => new PermanentVM() { EmployeeID = x.TPTEmployee.EmployeeID, FirstName = x.TPTEmployee.FirstName, LastName = x.TPTEmployee.LastName, Gender = x.TPTEmployee.Gender, AnnualSalary = x.AnnualSalary })
                             .ToList();

            tptViewModel.PermanentTPTEmployees = targetPEList;



            var EmployeeList = db.TPTEmployees
                                                  .GroupJoin(db.ContractTPTEmployees,
                                                             emp => emp.EmployeeID,
                                                             con => con.EmployeeID,
                                                             (emp, con) => new { Employee = emp, ContractEmployee = con })
                                                  .GroupJoin(db.PermanentTPTEmployees,
                                                             femp => femp.Employee.EmployeeID,
                                                             per => per.EmployeeID,
                                                             (femp, per) => new { femp.Employee, femp.ContractEmployee, PermanentEmployee = per })
                                                  .ToList();


            var FullList = EmployeeList
                           .Select(x => new TPTFullEmployeeViewModel() { EmployeeID = x.Employee.EmployeeID, FirstName = x.Employee.FirstName, LastName = x.Employee.LastName, Gender = x.Employee.Gender, AnnualSalary = (x.Employee.PermanentTPTEmployee == null) ? 0 : x.Employee.PermanentTPTEmployee.AnnualSalary, HourlyPay = (x.Employee.ContractTPTEmployee == null) ? 0 : x.Employee.ContractTPTEmployee.HourlyPay, HoursWorked = (x.Employee.ContractTPTEmployee == null) ? 0 : x.Employee.ContractTPTEmployee.HoursWorked })
                           .ToList();

            tptViewModel.tptFullEmployeeViewModel = FullList;



            var innerJoin = CE.Join(    //Inner Join
                            PE,         //Outer Join
                            contract => contract.EmployeeID, //inner key selector
                            permanent => permanent.EmployeeID,   //outer key selector
                            (contract, permanent) => new
                            {
                                FirstName = contract.TPTEmployee.FirstName,
                                LastName = contract.TPTEmployee.LastName,
                                Gender = contract
                            });



            return View(tptViewModel);
        }

        public void GetData()
        {
            var data = db.TPTEmployees.Join(db.ContractTPTEmployees, u => u.EmployeeID, uir => uir.EmployeeID, (u, uir) => new { u, uir })
                            .Join(db.PermanentTPTEmployees, r => r.uir.EmployeeID, ro => ro.EmployeeID, (r, ro) => new { r, ro }).ToList();

            var data1 = db.TPTEmployees.GroupJoin(db.ContractTPTEmployees,
                                                  foo => foo.EmployeeID,
                                                  bar => bar.EmployeeID,
                                                  (foo, bar) => bar.Select(x => new { TPTEmployee = foo, ContractTPTEmployee = bar })
                                                  .DefaultIfEmpty(new { TPTEmployee = foo, ContractTPTEmployee = bar }))
                                                  .SelectMany(g => g)
                                                  .ToList();


            var UserInRole = db.TPTEmployees.
                            Join(db.ContractTPTEmployees, u => u.EmployeeID, uir => uir.EmployeeID,
                            (u, uir) => new { u, uir }).
                            Join(db.PermanentTPTEmployees, r => r.uir.EmployeeID, ro => ro.EmployeeID,
                            (r, ro) => new { r, ro })
                            .Select(g => g)
                            .ToList();
        }

    }
}