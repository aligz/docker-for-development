## Docker for freelance web developer with multi project and environment service

I need to have development server with multiple diff environments, example: Laravel 5.4 with php 5 and mysql 5, and then another project with Laravel 7 with php version 7.4, and have to run together. I think docker on the other side, is made for it, with one machine we can work with multiple service.

## Environment
I defined 3 default running main service: nginx, php (7.4), mysql (8). You can change your main php or mysql version in docker-compose.yml file. Copy and rename the `.env.example` file to `.env` to set mysql user and password, and the container prefix as a docker variable. And don't forget to set the default user, in `UID` and `GID`. To get this id you can run command `id -u` for `UID` and `id -g $USER` for `GID`.

## Usage
To get started, make sure you have Docker installed on your system.
Next clone this repository to your main development directory, and run the docker compose command :

    docker-compose up -d --build sites

After that, docker will create containers with our main service, with the details of the open ports:
* **nginx** `:80`
* **mysql-8** `:3306`
* **php-74** `:9000`

To run additional service, like composer or npm, you can run this command:

    docker-compose run --rm -w "/path/to/sites/project" composer install
    docker-compose run --rm -w "/path/to/site/proeject" npm install
    
For file permission, I recommend for non root user, and this compose is designed for non root user.
## Custom Command
There some aliases command in `.docker-alias` file :

 1. Docker exec command to run bash inside docker service
	`dec {project_folder} {service}`
 2. Docker compose run
    `dcr {docker_compose_folder} {project_folder} {service} {options}	`
 3. Run artisan command
    `artisan {project_folder} {options}`
 4. Mysql shell
    `mysql`
 5. Nginx shell
    `nginx`
 6. Npm shell
    `npm`

You need export `.docker-alias` file in your bash profile to use this commands.