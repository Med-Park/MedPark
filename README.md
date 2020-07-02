# MedPark

This is a reference application for building a distrbuted application using microservices built with ASP.net Core with various other tools and services. The list below 
contains a summary ot tools and services used to build the solution.

### Tools used include
- [Domain Driven Design](http://dddcommunity.org) fundamentals
- SQL and NoSQL databases ([SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-2017), [MongoDB](https://www.mongodb.com)
- Distributed caching with [Redis](https://redis.io)
- [CQRS](https://martinfowler.com/bliki/CQRS.html), Commands, Queries & Events handlers
- Using [RabbitMQ](https://www.rabbitmq.com) as a message queue with [RawRabbit](https://github.com/pardahlman/RawRabbit)
- Microservice-to-Microservice HTTP communication with [RestEase](https://github.com/canton7/RestEase)
- Service discovery with [Consul](https://www.consul.io)
- Building [Docker](https://www.docker.com) images, managing containers
- Logging using [Serilog](https://serilog.net) and [Seq](https://getseq.net)
- Manage Builds and Deployments with [Azure DevOps](https://azure.microsoft.com/en-us/services/devops/)

### MedPark Contents
Below is a list off all the services, libraries and serverless functions that make MedPark run.

[API Service](https://github.com/Med-Park/MedPark.API.Gateway)
[Basket Service](https://github.com/Med-Park/MedPark.Basket)
[Booking Service](https://github.com/Med-Park/MedPark.Bookings)
[Catalog Service](https://github.com/Med-Park/MedPark.Catalog)
[Customer Service](https://github.com/Med-Park/MedPark.Customers)
[Identity Service](https://github.com/Med-Park/MedPark.Identity)
[Medical Practice Service](https://github.com/Med-Park/MedPark.MedicalPractice)
[Notification Service](https://github.com/Med-Park/MedPark.Notifications)
[Ordering Service](https://github.com/Med-Park/MedPark.Orders)
[Payment Service](https://github.com/Med-Park/MedPark.Payments)
[Frontend Web App](https://github.com/Med-Park/MedPark.Web)
[MedPark Common Library](https://github.com/Med-Park/MedPark.Common)
[Email Common Library](https://github.com/Med-Park/MedPark.Common.Email)
[Azure Functions](https://github.com/Med-Park/MedPark.Serverless)

### How to get started
To get started, you can clone this repo and then run the `/scripts/git-clone-all.ps1` Powershell script. This script will clone all the MedPark repositries listed above.

### Run infrastructure
To run MedPark, you first need to run all the foundational services that will be used by each of the services. The easiest and fast way to do this is by running a [Docker Compose](https://docs.docker.com/compose/) command:

``` docker
docker-compose -f ./scripts/medpark-infra-compose.yml up
```

Once we have the infrastructure up and running we can go ahead and run our services:

``` docker
docker-compose -f ./srcipts/medpark-services-compose.myl up
```

* Append the `--build` flag to the end of the command above if you are running the command for the first time.

All services will be accessible using ports 8000+ when running in docker




