terraform {}
    locals {
    values = "Hello world"
    }
    variable "String_list" {
        type = list(string)
        default = [ "server1", "server2", "server3", "server2", "server3"] 
    }

    output "output" {
    #   value = upper((local.values))
    #   value = lower((local.values))
    #   value = startswith(local.values, "h")
    # value = min(1, 2, 3, 4, 5)
    # value = abs(-15)
    # value = length(var.String_list
    # value = join(" : ", var.String_list)
    # value = contains(var.String_list, "server")
    # value = var.String_list
    value = toset(var.String_list)
    }
