using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;
using System.Text;

namespace Wemart.Helpers.Enums
{
    public static class EnumHelper
    {
        private static Dictionary<Enum, DescriptionAttribute> _stringValues = new Dictionary<Enum, DescriptionAttribute>();
        public static string GetDescription(this Enum status)
        {
            string output = null;
            Type type = status.GetType();

            //Check first in our cached results...
            if (_stringValues.ContainsKey(status))
                output = (_stringValues[status] as DescriptionAttribute).Description;
            else
            {
                //Look for our 'StringValueAttribute' 
                //in the field's custom attributes
                FieldInfo fi = type.GetField(status.ToString());
                DescriptionAttribute[] attrs =
                   fi.GetCustomAttributes(typeof(DescriptionAttribute),
                                           false) as DescriptionAttribute[];
                if (attrs.Length > 0)
                {
                    _stringValues.Add(status, attrs[0]);
                    output = attrs[0].Description;
                }
                else
                {
                    output = attrs[0].ToString();
                }
            }

            return output;
        }
    }
}
