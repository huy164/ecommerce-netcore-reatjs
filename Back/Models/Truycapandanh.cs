using System;
using System.Collections.Generic;
using Newtonsoft.Json;
#nullable disable

namespace Back.Models
{
    public partial class Truycapandanh
    {
        public Truycapandanh()
        {
        }

        public int Matruycap { get; set; }
        public string Ip { get; set; }
        public DateTime Thoidiem { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
