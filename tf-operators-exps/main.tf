terraform {}


# Number List
variable "num_list" {
  type    = list(number)
  default = [1, 2, 3, 4, 5]
}

# #object list of person 
variable "person_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [{
    fname = "Prince"
    lname = "Chauhan"
    }, {
    fname = "Sumit"
    lname = "Chauhan"
  }]
}

variable "maplist" {
  type = map(number)
  default = {
    "One"   = 1
    "Two"   = 2
    "Three" = 3
  }
}

# Calculation
locals {
  mul = 2 * 4
  add = 2 + 4
  eq  = 2 != 4
  #double  the lsit 
  double = [for num in var.num_list : num * 2]
#   odd number only
    odd = [for num in var.num_list : num if num % 2 != 0]

# person lsit with full name
    fname =[ for person in var.person_list : person.fname]
    lname =[ for person in var.person_list : person.lname]

# working with map

map_info = [ for key, value in var.maplist:value *5]

double_map ={ for key,value in var.maplist : key => value * 5}
}



output "output" {
  value = local.double_map
}



