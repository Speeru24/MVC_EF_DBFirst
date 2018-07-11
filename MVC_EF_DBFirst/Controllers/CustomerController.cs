using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC_EF_DBFirst.Models;
using MVC_EF_DBFirst.ViewModels;
using System.Data.Entity;

namespace MVC_EF_DBFirst.Controllers
{
    public class CustomerController : Controller
    {
        private EF_DBFirstEntities1 db = new EF_DBFirstEntities1();

        // GET: Customer
        public ActionResult Index()
        {
            var Customer = db.Customers.ToList();
            var Orders = db.Orders.ToList();


            //using LINQ Method
            var CustomerOrdersList = Customer.Join(
                Orders,
                cust => cust.CustomerID,
                order => order.CustomerID,
                (cust, order) => new
                {
                    CustomerID = cust.CustomerID,
                    CustomerName = cust.CustomerName,
                    ContactNumber = cust.ContactNo,
                    OrderDate = order.OrderDate
                });

            //Using LINQ Query
            CustomerOrdersList = from c in Customer
                                 join o in Orders
                                 on c.CustomerID equals o.CustomerID
                                 select new
                                 {
                                     CustomerID = c.CustomerID,
                                     CustomerName = c.CustomerName,
                                     ContactNumber = c.ContactNo,
                                     OrderDate = o.OrderDate
                                 };



            var customerVMList = (CustomerOrdersList.
                                Select(x => new CustomerOrdersViewModel()
                                {
                                    CustomerID = x.CustomerID,
                                    CustomerName = x.CustomerName,
                                    ContactNumber = x.ContactNumber,
                                    OrderDate = (x.OrderDate == null) ? DateTime.MinValue : (DateTime)x.OrderDate
                                })).ToList();

            CustomerOrdersViewModel customerOrdersVM = new CustomerOrdersViewModel();
            customerOrdersVM.customerList = customerVMList;



            return View(customerOrdersVM);
        }

        [HttpGet]
        public ActionResult EditCustomer(int? id)
        {
            var customers = db.Customers.ToList();
            var orders = db.Orders.ToList();

            var customerOrders = (customers.Join(
                orders,
                c => c.CustomerID,
                o => o.CustomerID,
                (c, o) => new CustomerOrdersViewModel
                {
                    CustomerID = c.CustomerID,
                    CustomerName = c.CustomerName,
                    ContactNumber = c.ContactNo,
                    OrderID = o.OrderID,
                    OrderDate = (o.OrderDate == null) ? DateTime.MinValue : (DateTime)o.OrderDate
                })).ToList();


            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            CustomerOrdersViewModel customer = customerOrders.FirstOrDefault(x=> x.CustomerID ==id);
            
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SaveCustomer(CustomerOrdersViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (model.CustomerID > 0)
                {
                    var customer = new Customer { CustomerID = model.CustomerID, CustomerName = model.CustomerName, ContactNo = model.ContactNumber };
                    var orders = new Order { CustomerID=model.CustomerID, OrderDate=model.OrderDate, OrderID=model.OrderID };
                    //db.Customers.FirstOrDefault(x => x.CustomerID == customer.CustomerID);



                    db.Entry(customer).State = EntityState.Modified;
                    db.Entry(orders).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            


            return View("EditCustomer",model);
        }


    }
}