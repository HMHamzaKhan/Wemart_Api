using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Entities.ViewModels.AppVM;
using Wemart.Repositories;
using Wemart.Helpers.Enums;
using Wemart.Entities.Entities;
using Wemart.Helpers;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderRepository orderRepository;
        public OrderController(IOrderRepository orderRepository) => this.orderRepository = orderRepository;


        [HttpGet, Route("GetOrderDetailsByUserID/{UserID}")]
        public async Task<IActionResult> GetOrderDetailsByUserID(int UserID)
        {
            try
            {
                DataTable dt = await orderRepository.GetOrdersbyUserType(UserTypes.User, UserID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "you have no delevered orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpGet, Route("GetOrderDetailsByShopID/{ShopID}")]
        public async Task<IActionResult> GetOrderDetailsByShopID(int ShopID)
        {
            try
            {
                DataTable dt = await orderRepository.GetOrdersbyUserType(UserTypes.Shop, ShopID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "you have no delevered orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetOrderDetailsByRiderID/{RiderID}")]
        public async Task<IActionResult> GetOrderDetailsByRiderID(int RiderID)
        {
            try
            {
                DataTable dt = await orderRepository.GetOrdersbyUserType(UserTypes.Rider, RiderID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "you have no delevered orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpGet, Route("GetApprovedOrders")]
        public async Task<IActionResult> GetApprovedOrders()
        {
            try
            {
                DataTable dt = await orderRepository.GetOrdersbyUserType(UserTypes.Admin, 0);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "there are no approved orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }




        [HttpGet, Route("ApproveOrderByShop/{OrderID}/{ShopID}")]
        public async Task<IActionResult> ApproveOrderByShop(int OrderID, int ShopID)
        {
            try
            {

                bool hasResponse = await orderRepository.ApproveOrderByShop(OrderID, ShopID);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "Order Approved" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }




        [HttpGet, Route("PickOrderByID/{OrderID}")]
        public async Task<IActionResult> PickOrderByID(int OrderID)
        {
            try
            {

                bool hasResponse = await orderRepository.UpdateStatus(OrderID, 4);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "Order's Status Is Updated" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("DeliverOrderByID/{OrderID}")]
        public async Task<IActionResult> DeliverOrderByID(int OrderID)
        {
            try
            {
                bool hasResponse = await orderRepository.UpdateStatus(OrderID, 5);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "Order's Status Is Updated" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }




        [HttpGet, Route("ApproveOrderByRider/{OrderID}/{RiderID}")]
        public async Task<IActionResult> ApproveOrderByRider(int OrderID, int RiderID)
        {
            try
            {

                bool hasResponse = await orderRepository.ApproveOrderByRider(OrderID, RiderID);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "Order Approved" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("AssignOrderToRider/{OrderID}/{RiderID}")]
        public async Task<IActionResult> AssignOrderToRider(int OrderID, int RiderID)
        {
            try
            {
                bool hasResponse = await orderRepository.AssignOrderToRider(OrderID, RiderID);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "Order is assigned to rider successfully" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpPost, Route("CheckOut")]
        public async Task<IActionResult> CheckOut(OrderDetailVM orderDetail)
        {
            try
            {
                int orderID = await orderRepository.CheckOut(orderDetail);

                bool hasResponse = orderID != 0;

                return Ok(new ApiResponseModel<String>
                {
                    HasReponse =  hasResponse,
                    Message    = !hasResponse ? "Something Went Wrong" : null,
                    Reponse    =  hasResponse ? orderID.ToString()  : null
                });

            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("AddCurrentRiderLocation")]
        public async Task<IActionResult> AddCurrentRiderLocation(OrderRouteEntity entity)
        {
            try
            {
                bool hasResponse = await orderRepository.AddCurrentRiderLocation(entity);
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something Went Wrong" : null,
                    Reponse = hasResponse ? "location updated" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetCurrentRiderLocationByOrderID/{OrderID}")]
        public async Task<IActionResult> GetCurrentRiderLocationByOrderID(int OrderID)
        {
            try
            {
                DataTable dt = await orderRepository.GetCurrentRiderLocationByOrderID(OrderID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "you have no delevered orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetRiderLocationByOrderID/{OrderID}")]
        public async Task<IActionResult> GetRiderLocationByOrderID(int OrderID)
        {
            try
            {
                DataTable dt = await orderRepository.GetRiderLocationByOrderID(OrderID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "you have no delevered orders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GenerateBillByOrderID/{OrderID}")]
        public async Task<IActionResult> GenerateBillByOrderID(int OrderID)
        {   
            //   <td><strong> 3 X Chicken Biryani < p style = 'text-align: left;' > Rs 360.00 </ p > </ strong > </ td >
            try
            {
                DataTable dt = await orderRepository.GetBillByOrderID(OrderID);
                string content = Email.GetEmailTemplateBody(EmailBodyEnum.Invoice);

                string productDetail = (string) dt.Rows[0]["ProductDetails"];
                int ID               = (int) dt.Rows[0]["OrderID"];
                string UserEmail     = (string)dt.Rows[0]["Email"];
                string FullName      = (string) dt.Rows[0]["FullName"];
                string ShopName      = (string) dt.Rows[0]["ShopName"];
                string ShopAddress   = (string) dt.Rows[0]["ShopAddress"];
                string ShopNumber    = (string) dt.Rows[0]["ShopNumber"];
                string StatusName    = (string) dt.Rows[0]["StatusName"];
                DateTime OrderDate   = (DateTime) dt.Rows[0]["OrderDate"];
                string RiderName     = dt.Rows[0]["RiderName"] == DBNull.Value ? "No Rider Assigned Yet" : dt.Rows[0]["RiderName"].ToString();
                string OrderLocation = (string) dt.Rows[0]["OrderLocation"];
                decimal TotalPrice   = (decimal) dt.Rows[0]["TotalPrice"];
                
                string tr = $"<tr><td><strong> { productDetail } </ strong > </ td > </tr >";

                content = content.Replace("@FullName", FullName);
                content = content.Replace("@OrderDate", OrderDate.Date.ToLongDateString());
                content = content.Replace("@Location", OrderLocation);
                content = content.Replace("@ShopName", ShopName);
                content = content.Replace("@ShopLocation", ShopAddress);
                content = content.Replace("@ShopNumber", ShopNumber);
                content = content.Replace("@Status", StatusName);
                content = content.Replace("@RiderName", RiderName);
                content = content.Replace("@BillDate", DateTime.Now.Date.ToLongDateString());
                content = content.Replace("@OrderID",   ID.ToString());
                content = content.Replace("@tr",   tr);     
                content = content.Replace("@Total", TotalPrice.ToString());


                bool hasResponse = await Email.SendEmailAsync(UserEmail, "", "Invoice", content);

                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something went wrong" : null,
                    Reponse = "Email sent to You You can check bill from there"
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}