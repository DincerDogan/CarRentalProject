using Business.Concrete;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using DataAccess.Concrete.InMemory;
using Entities.Concrete;
using System;

namespace ConsoleUI
{
    class Program
    {
        public static object CarManager { get; private set; }

        static void Main(string[] args)
        {
            int _secim;
            bool _loop = true;

            CarManager carManager = new CarManager(new EfCarDal());
            BrandManager brandManager = new BrandManager(new EfBrandDal());
            ColorManager colorManager = new ColorManager(new EfColorDal());




            //foreach (var car in carManager.GetCarDetails())
            //{
            //    Console.WriteLine(String.Format("{0,-5 }{1,-30}{2,-15}{3,-10}{4,-8}" , car.CarId ,car.CarName,car.BrandName,car.ColorName,car.DailyPrice));
            //}

            do
            {
                Console.Clear();
                Console.WriteLine("<<< CAR RENTAL PROJECT >>>");
                Console.WriteLine("--------------------------");
                Console.WriteLine("[ 1 ] - Araç Ekleme");
                Console.WriteLine("[ 2 ] - Araç Listeleme - <Tamamı>");
                Console.WriteLine("[ 3 ] - Araç Listeleme - <Markasına Göre>");
                Console.WriteLine("[ 4 ] - Araç Listeleme - <Rengine Göre>");
                Console.WriteLine("[ 5 ] - Araç Güncelleme");
                Console.WriteLine("[ 6 ] - Araç Silme");       
                Console.WriteLine("[ 7 ] - Marka Ekleme");
                Console.WriteLine("[ 8 ] - Marka Listeleme");
                Console.WriteLine("[ 9 ] - Renk Ekleme");
                Console.WriteLine("[ 10] - Renk Listeleme");
                Console.WriteLine("\n[ 99] - ÇIKIŞ");
                Console.WriteLine("--------------------------");

                Console.Write("\nSeciminiz: ");
                _secim = Convert.ToInt32(Console.ReadLine());

                switch (_secim)
                {
                    case 1:
                        ListToBrands(brandManager);
                        Console.WriteLine();
                        ListToColors(colorManager);
                        Console.WriteLine();
                        AddToCar(carManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 2:
                        ListToCars(carManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 3:
                        ListToBrands(brandManager);
                        ListToCarsByBrandId(carManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();

                        break;
                    case 4:
                        ListToColors(colorManager);
                        ListToCarsByColorId(carManager);

                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;

                    case 5:
                        UpdateToCar(carManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 6:
                        DeleteToCar(carManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 7:
                        ListToBrands(brandManager);
                        AddToBrand(brandManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 8:
                        ListToBrands(brandManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 9:
                        ListToColors(colorManager);
                        AddToColor(colorManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 10:
                        ListToColors(colorManager);
                        Console.Write("\nMenüye dönmek için ENTER tuşuna basınız....");
                        Console.ReadLine();
                        break;
                    case 99:
                        _loop = false;
                        break;
                }
            } while (_loop);
        }

        private static void AddToColor(ColorManager colorManager)
        {
            string _colorName;
            Console.Write("\nEklemek istediğiniz yeni Renk Adı : ");
            _colorName = Console.ReadLine();

            Color color = new Color
            {
                ColorName = _colorName
            };

            colorManager.Add(color);
        }

        private static void AddToBrand(BrandManager brandManager)
        {
            string _brandName;
            Console.Write("\nEklemek istediğiniz yeni Marka Adı : ");
            _brandName = Console.ReadLine();

            Brand brand = new Brand
            {
                BrandName = _brandName
            };

            brandManager.Add(brand);
        }

        private static void ListToCarsByColorId(CarManager carManager)
        {
            Console.Write("Listelemek istediğiniz Renk ID : ");
            int listColorId = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("---------------------------------------------------------------------------------------------");
            Console.WriteLine(String.Format("| {0,-5}| {1,-10}| {2,-10}| {3,-10}| {4,-15}| {5,-30}|", "ID", "BRAND ID", "COLOR ID", "MODEL YEAR", "DAILY PRICE", "DESCRIPTION"));
            Console.WriteLine("---------------------------------------------------------------------------------------------");

            foreach (var car in carManager.GetCarsByColorId(listColorId))
            {
                Console.WriteLine(String.Format("| {0,-5}| {1,-10}| {2,-10}| {3,-10}| {4,-15}| {5,-30}|", car.Id, car.BrandId, car.ColorId, car.ModelYear, car.DailyPrice, car.Description));
            }
            Console.WriteLine("---------------------------------------------------------------------------------------------");
        }

        private static void ListToCarsByBrandId(CarManager carManager)
        {
            Console.Write("Listelemek istediğiniz Marka ID : ");
            int listBrandId = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("---------------------------------------------------------------------------------------------");
            Console.WriteLine(String.Format("| {0,-5}| {1,-10}| {2,-10}| {3,-10}| {4,-15}| {5,-30}|", "ID", "BRAND ID", "COLOR ID", "MODEL YEAR", "DAILY PRICE", "DESCRIPTION"));
            Console.WriteLine("---------------------------------------------------------------------------------------------");

            foreach (var car in carManager.GetCarsByBrandId(listBrandId))
            {
                Console.WriteLine(String.Format("| {0,-5}| {1,-10}| {2,-10}| {3,-10}| {4,-15}| {5,-30}|", car.Id, car.BrandId, car.ColorId, car.ModelYear, car.DailyPrice, car.Description));
            }
            Console.WriteLine("---------------------------------------------------------------------------------------------");
        }

        private static void ListToColors(ColorManager colorManager)
        {
            Console.WriteLine("-------------------------");
            Console.WriteLine(String.Format("| {0,-5}| {1,-15}|", "ID", "RENK"));
            Console.WriteLine("-------------------------");

            foreach (var colors in colorManager.GetAll())
            {
                Console.WriteLine(String.Format("| {0,-5}| {1,-15}|", colors.Id, colors.ColorName));
            }
            Console.WriteLine("-------------------------");
        }

        private static void ListToBrands(BrandManager brandManager)
        {
            Console.WriteLine("-------------------------");
            Console.WriteLine(String.Format("| {0,-5}| {1,-15}|", "ID", "MARKA"));
            Console.WriteLine("-------------------------");

            foreach (var brands in brandManager.GetAll())
            {
                Console.WriteLine(String.Format("| {0,-5}| {1,-15}|", brands.Id, brands.BrandName));
            }
            Console.WriteLine("-------------------------");            
        }

        private static void DeleteToCar(CarManager carManager)
        {
            ListToCars(carManager);

            int _deleteId;
            Console.WriteLine();

            Console.Write("Silmek istediğiniz Kayıt ID : ");
            _deleteId = Convert.ToInt32(Console.ReadLine());

            Car deleteCar = new Car { Id = _deleteId };

            carManager.Delete(deleteCar);
            Console.WriteLine();

            Console.WriteLine("<<< Listenin Son Hali >>>");
            ListToCars(carManager);
        }

        private static void AddToCar(CarManager carManager)
        {
            int _brandId, _colorId, _modelYear;
            decimal _dailyPrice;
            string _description;

            ListToCars(carManager);
            Console.WriteLine();
            
            Console.Write("Marka ID : ");
            _brandId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Renk ID : ");
            _colorId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Günlük Fiyat : ");
            _dailyPrice = Convert.ToDecimal(Console.ReadLine());
            Console.Write("Model Yılı : ");
            _modelYear = Convert.ToInt32(Console.ReadLine());
            Console.Write("Açıklama : ");
            _description = Console.ReadLine();
            Console.WriteLine();


            Car car = new Car()
            {                
                BrandId = _brandId,
                ColorId = _colorId,
                ModelYear = _modelYear,
                DailyPrice = _dailyPrice,
                Description = _description
            };

            carManager.Add(car);
            Console.WriteLine();
            ListToCars(carManager);
        }

        private static void ListToCars(CarManager carManager)
        {
            Console.WriteLine("------------------------------------------------------------------------------------------------");
            Console.WriteLine(String.Format("| {0,-5 }| {1,-30}| {2,-20}| {3,-15}| {4,-15}|", "ID", "CAR NAME", "BRAND NAME", "CAR COLOR", "DAILY PRICE"));
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            foreach (var car in carManager.GetCarDetails())
            {
                Console.WriteLine(String.Format("| {0,-5 }| {1,-30}| {2,-20}| {3,-15}| {4,-15}|", car.CarId, car.CarName, car.BrandName, car.ColorName, car.DailyPrice));
            }

            //foreach (var car in carManager.GetAll())
            //{
            //    Console.WriteLine(String.Format("| {0,-5}| {1,-10}| {2,-10}| {3,-10}| {4,-15}| {5,-30}|", car.Id, car.BrandId, car.ColorId, car.ModelYear, car.DailyPrice, car.Description));
            //}

            Console.WriteLine("------------------------------------------------------------------------------------------------");
        }

        private static void UpdateToCar(CarManager carManager)
        {
            int _updateCarId, _brandId, _colorId, _modelYear;
            decimal _dailyPrice;
            string _description;
            
            ListToCars(carManager);
            Console.WriteLine();

            Console.Write("Güncellemek istediğiniz Kayıt ID : ");
            _updateCarId = Convert.ToInt32(Console.ReadLine());

            Console.Write("Marka ID : ");
            _brandId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Renk ID : ");
            _colorId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Günlük Fiyat : ");
            _dailyPrice = Convert.ToDecimal(Console.ReadLine());
            Console.Write("Model Yılı : ");
            _modelYear = Convert.ToInt32(Console.ReadLine());
            Console.Write("Açıklama : ");
            _description = Console.ReadLine();
            Console.WriteLine();

            Car updateCar = new Car { Id = _updateCarId,BrandId= _brandId, ColorId= _colorId, 
                                        DailyPrice= _dailyPrice, ModelYear= _modelYear, Description= _description 
                                    };

            carManager.Update(updateCar);
            
            Console.WriteLine("\n>>>> Son liste <<<<");
            ListToCars(carManager);
        }
    }
}
