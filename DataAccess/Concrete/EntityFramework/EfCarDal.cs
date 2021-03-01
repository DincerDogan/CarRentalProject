using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.DTOs;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCarDal : EfEntityRepositoryBase<Car, CarRentalContext>, ICarDal
    {
        public List<CarDetailDto> GetCarDetails()
        {
            using (CarRentalContext context = new CarRentalContext())
            {
                var result = from cr in context.Cars
                             join b in context.Brands on cr.BrandId equals b.Id
                             join cl in context.Colors on cr.ColorId equals cl.Id
                             select new CarDetailDto 
                             { 
                                 CarId = cr.Id, 
                                 CarName = cr.Description, 
                                 BrandName = b.BrandName, 
                                 ColorName = cl.ColorName, 
                                 DailyPrice = cr.DailyPrice 
                             };
                return result.ToList();
            }
        }
    }
}
