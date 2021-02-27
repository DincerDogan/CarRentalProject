using System;

namespace KimlikSorgulama
{
    class Program
    {
        static void Main(string[] args)
        {

            Person person = new Person()
            {
                Id = 1,
                IndentityNumber = 123456,
                Name = "Cem",
                LastName = "Özaydın",
                BirthYear = 1980
            };

            PersonManager personManager = new PersonManager();
            personManager.Add(person);

            if (personManager.CheckPerson(person)==true)
            {
                Console.WriteLine("Kimlik Doğrulandı");
            }
            else
            {
                Console.WriteLine("Mernis'de böyle bir kayıt bulunamadı.");
            }

        }
    }
}
