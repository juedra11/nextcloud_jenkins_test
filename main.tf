terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}


provider "docker"{
    host = "unix:///var/run/docker.sock"
}

#################### NETWORKS #######################

resource "docker_network" "nextcloud_network"{
    name = "nextcloud_network"
}

#################### IMAGENES #######################

resource "docker_image" "nextcloud"{
    name = "nextcloud"
}

resource "docker_image" "mariadb"{
    name="mariadb:10.6"
}

#################### CONTENEDORES #######################

resource "docker_container" "mariadb_nextcloud"{
    name = "${var.db_name_cont}"
    image = docker_image.mariadb.name

    networks_advanced{
        name = docker_network.nextcloud_network.name
    }

    env = [
        "MYSQL_ROOT_PASSWORD=${var.db_password_root}",
        "MYSQL_PASSWORD=${var.db_password}",
        "MYSQL_DATABASE=${var.db_name}",
        "MYSQL_USER=${var.db_user}",
    ]
    
    ports{
        internal = 3306
        external = 3303
    }

}


resource "docker_container" "web_nextcloud"{

    name = "${var.nextcloud_name}"
    image= docker_image.nextcloud.name

    networks_advanced{
        name = docker_network.nextcloud_network.name
    }

    env = [
        "MYSQL_PASSWORD=${var.db_password}",
        "MYSQL_DATABASE=${var.db_name}",
        "MYSQL_USER=${var.db_user}",
        "MYSQL_HOST=${docker_container.mariadb_nextcloud.name}",
    ]

    ports {
        internal = 80
        external = 8011
    }


    volumes {
        ## host_path = "/mnt/prueba_qnap"
        host_path = "./volumen"
        container_path = "/var/html/www/data"
    }

    depends_on =[
        docker_container.mariadb_nextcloud
    ]



}










