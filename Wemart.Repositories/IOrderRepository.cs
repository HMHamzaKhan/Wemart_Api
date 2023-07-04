using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Entities.ViewModels.AppVM;
using Wemart.Helpers.Enums;

namespace Wemart.Repositories
{
    public interface IOrderRepository
    {
        Task<int> CheckOut(OrderDetailVM orderDetail);
        Task<bool> AssignOrderToRider(int OrderID, int RiderID);
        Task<bool> ApproveOrderByRider(int OrderID, int RiderID);
        Task<bool> ApproveOrderByShop(int OrderID, int VendorID);

        Task<bool> UpdateStatus(int OrderID, int StatusID);

        Task<bool> AddCurrentRiderLocation(OrderRouteEntity entity);
        Task<DataTable> GetCurrentRiderLocationByOrderID(int OrderID);
        Task<DataTable> GetRiderLocationByOrderID(int OrderID);
        Task<DataTable> GetBillByOrderID(int OrderID);

        Task<DataTable> GetOrdersbyUserType(UserTypes userType, int ID);

    }
}
