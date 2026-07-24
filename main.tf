terraform {
	required_providers {
		docker = {
			source  = "kreuzwerker/docker"
			version = "~> 4.5"
    	}
  	}
}

provider "docker" {
	host = "unix:///var/run/docker.sock"
}

resource "docker_network" "jen_net" {
	name = "jen-net-1"
}

resource "docker_image" "app" {
	name = "my-app:latest"
	keep_locally = true
}

resource "docker_container" "app" {
	name = "my-app"
	image = docker_image.app.image_id
	restart = "unless-stopped"

	networks_advanced {
		name = docker_network.jen_net.name
	}

	ports {
		internal = 5000
		external = 5000
  	}
}