using MernisServiceReference;
using System;
using System.Collections.Generic;
using System.Text;

namespace KimlikSorgulama
{
    public class PersonManager
    {
        public void Add(Person person) 
        {
            Console.WriteLine(person.Name + " Kişi gerçektir");
        }

        public bool CheckPerson(Person person)
        {
            KPSPublicSoapClient client = new KPSPublicSoapClient(KPSPublicSoapClient.EndpointConfiguration.KPSPublicSoap);


            //bool result = client.TCKimlikNoDogrulaAsync(new TCKimlikNoDogrulaRequest
            //    (new TCKimlikNoDogrulaRequestBody(11567525530,"CEM","ÖZAYDIN",1980))).Result.Body.TCKimlikNoDogrulaResult;

            bool result = client.TCKimlikNoDogrulaAsync(new TCKimlikNoDogrulaRequest
                (new TCKimlikNoDogrulaRequestBody(person.IndentityNumber, person.Name.ToUpper(), person.LastName.ToUpper(), person.BirthYear))).Result.Body.TCKimlikNoDogrulaResult;

            return result;
        }

    }
}
