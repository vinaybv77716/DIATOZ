[
  {
    "name": "diatoz_container",
    "image": "${app_image}:${tag}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/cb-app",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ],
    "environment": [
        {
          "name": "MYSQL_HOST",
          "value": "mysql"
        },
        {
          "name": "MYSQL_USER",
          "value": "admin"
        }
         {
          "name": "MYSQL_PASSWORD",
          "value": "admin"
        },
        {
          "name": "MYSQL_DB",
          "value": "myDb"
        }
        // Add more environment variables as needed
      ]
  }




    {
      "name": "diatoz_backend",
      "image": "mysql:5.7",
      "portMappings": [
        {
          "containerPort": 3306,
          "hostPort": 3306
        }
      ],
      "environment": [
        {
          "name": "MYSQL_ROOT_PASSWORD",
          "value": "myDb"
        },
        {
          "name": "MYSQL_DATABASE",
          "value": "myDb"
        }
         {
          "name": "MYSQL_USER",
          "value": "admin"
        },
        {
          "name": "MYSQL_PASSWORD",
          "value": "admin"
        }
        // Add more environment variables as needed
      ]
    }
 

  







]

