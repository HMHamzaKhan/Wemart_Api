using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Entities.ViewModels.AppVM;
using Wemart.Helpers;
using Wemart.Helpers.Enums;
using Wemart.Repositories;

namespace Wemart.SQL.DAL
{
    public class Orders : IOrderRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();

        public async Task<bool> ApproveOrderByRider(int OrderID, int RiderID)
        {
            Params.Clear();
            Params.Add("@RiderID", RiderID);
            Params.Add("@OrderID", OrderID);
            string Query = "update Orders set StatusID = 3 where ID = @OrderID"; //status approved by Rider
            return await connection.AddOrUpdateTblAsync(Params, Query);
        }

        public async Task<bool> ApproveOrderByShop(int OrderID, int VendorID)
        {
            Params.Clear();
            Params.Add("@VendorID", VendorID);
            Params.Add("@OrderID",  OrderID);
            string Query = "update Orders set StatusID = 2, IsApproved = 1, ShopID = @VendorID where ID = @OrderID"; //statuse approved by shop
           
            return await connection.AddOrUpdateTblAsync(Params, Query);
        }

        public async Task<bool> AssignOrderToRider(int OrderID, int RiderID)
        {
            Params.Clear();
            Params.Add("@RiderID", RiderID);
            Params.Add("@OrderID", OrderID);
            string Query = "update Orders set StatusID = 2, RiderID = @RiderID where ID = @OrderID";
            return await connection.AddOrUpdateTblAsync(Params, Query);
        }

        public async Task<int> CheckOut(OrderDetailVM orderDetail)
        {
            Params.Clear();

            int OrderID = await connection.GetNextIDAsync("Orders");

            string orderQuery = @"insert into Orders (ID, ShopID, UserID, TotalPrice, CreatedDate, CreatedTime, IsApproved, StatusID, Location, Latitude, Longitude) 
                                  values (@ID, @ShopID, @UserID, @TotalPrice, @CreatedDate, @CreatedTime, @IsApproved, @StatusID, @Location, @Latitude, @Longitude)";

            Params.Add("@ID", OrderID);
            Params.Add("@UserID", orderDetail.OrderMaster.UserID);

            Params.Add("@ShopID", orderDetail.OrderMaster.ShopID);
            Params.Add("@TotalPrice", orderDetail.OrderMaster.TotalPrice);
            Params.Add("@CreatedDate", orderDetail.OrderMaster.CreatedDate);

            Params.Add("@IsApproved", orderDetail.OrderMaster.IsApproved);
            Params.Add("@StatusID",  orderDetail.OrderMaster.StatusID = 1);
            Params.Add("@CreatedTime", orderDetail.OrderMaster.CreatedTime);

            Params.Add("@Latitude",  orderDetail.OrderMaster.Latitude );
            Params.Add("@Longitude", orderDetail.OrderMaster.Longitude );
            Params.Add("@Location",  orderDetail.OrderMaster.Location ?? "");

            string orderProduct = " insert into OrderProducts (OrderID, ProductID, Quantity, TotalPrice) values ";
            string orderFormat  = "({0}, {1}, {2}, {3}),";

            for (int i = 0; i < orderDetail.OrderProducts.Count; i++)
            {
                var product = orderDetail.OrderProducts[i];

                (string para1, string para2, string para3, string para4) = ("@OP1" + i, "@OP2" + i, "@OP3" + i, "@OP4" + i);

                orderProduct += String.Format(orderFormat, para1, para2, para3, para4);

                Params.Add(para1, OrderID);
                Params.Add(para2, product.ProductID);
                Params.Add(para3, product.Quantity);
                Params.Add(para4, product.TotalPrice);

            }

            orderProduct = orderProduct.Remove(orderProduct.Length - 1, 1);

            return await connection.AddOrUpdateTblAsync(Params, orderQuery + orderProduct) ? OrderID : 0;

        }


        public async Task<DataTable> GetOrdersbyUserType(UserTypes userType, int ID)
        {
            string storedProcedure = String.Empty;
            switch (userType)
            {
                case UserTypes.Admin:
                    storedProcedure = "spGetApprovedOrders";
                    break;

                case UserTypes.Shop:
                    storedProcedure = "spGetOrdersByShopID";
                    break;

                case UserTypes.User:
                    storedProcedure = "spGetOrdersByUserID";
                    break;

                case UserTypes.Rider:
                    storedProcedure = "spGetOrdersByRiderID";
                    break;
            }

            return await connection.GetDataAsync(storedProcedure, new Dictionary<string, object> { {"@ID", ID } }, true);
        }

        public async Task<bool> UpdateStatus(int OrderID, int StatusID)
        {
            Params.Clear();
            Params.Add("@StatusID", StatusID);
            Params.Add("@OrderID", OrderID);
            string Query = "update Orders set StatusID = @StatusID where ID = @OrderID";
            return await connection.AddOrUpdateTblAsync(Params, Query);
        }

        public async Task<DataTable> GetCurrentRiderLocationByOrderID(int OrderID) =>
            await connection.GetDataAsync("spGetCurrentRiderLocation", new Dictionary<string, object> { { "@OrderID", OrderID } }, true);

        public async Task<DataTable> GetRiderLocationByOrderID(int OrderID) =>
            await connection.GetDataAsync("spGetRiderLocationByID", new Dictionary<string, object> { { "@OrderID", OrderID } }, true);

        public async Task<bool> AddCurrentRiderLocation(OrderRouteEntity entity)
        {
            Params.Clear();
            Params.Add("@OrderID", entity.OrderID);
            Params.Add("@Latitude", entity.Latitude);
            Params.Add("@Longitude", entity.Longitude);
            return await connection.AddOrUpdateTblAsync(Params, "spAddCurrentRiderLocation", true);
        }

        public async Task<DataTable> GetBillByOrderID(int OrderID) => await connection.GetDataAsync("spGetOrderDetailsByID", new Dictionary<string, object> { { "@OrderID", OrderID } }, true);

    }
}
