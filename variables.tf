
############## VARIABLES PARA LOS CONTENEDORES ############################

variable "nextcloud_name" {
  type        = string
  default     = "nextcloud_default"
  description = "Es el nombre que se le asigna al contenedor de la web de nextcloud"
}

variable "db_name_cont" {
  type        = string
  default     = "db_nextcloud_default"
  description = "Es el nombre que se le asigna al contenedor de la base de datos que utilizará nextcloud"
}


############## VARIABLES PARA LA CONEXIÓN A BASE DE DATOS #######################

variable "db_user" {
  type        = string
  default     = "db_usuario"
  description = "Nombre de usuario que utilizará la base de datos"
}

variable "db_password" {
  type        = string
  default     = "db_contra"
  description = "Contraseña que va a utilizar la base de datos"
}

variable "db_name" {
  type        = string
  default     = "db_nombre"
  description = "Nombre de la base de datos que se va a crear"
}

variable "db_user_root" {
  type        = string
  default     = "root"
  description = "Nombre de usuario root que tendrá la base de datos"
}

variable "db_password_root" {
  type        = string
  default     = "1234123"
  description = "Contraseña que tendrá el usuario root de la base de datos"
}







