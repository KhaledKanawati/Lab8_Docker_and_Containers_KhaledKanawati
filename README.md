# Lab 8 - Docker and Containers

Khaled Kanawati

## Files

- `hello_world/`: Flask Hello World example for Activity 1
- `lab5_api/`: Lab 5 user-management API (port 5000)
- `get_users_api/`: `GET /get_users` (port 3000)
- `postman/`: Lab 5 Postman collection
- `evidence/`: screenshots from the Docker exercises
- `Lab8_Report_Khaled_Kanawati.docx`: command explanations and screenshots

## Activity 1

From the project root, build and run the example:

```powershell
docker build -t flask_docker ./hello_world
docker run -d --name lab8-hello -p 5000:5000 flask_docker
docker ps -a
docker stop lab8-hello
docker logs lab8-hello
```

Port 5000 must be free before running the Hello World example.

## Activity 2

Start Docker Desktop. From PowerShell in this folder:

```powershell
.\run.ps1
```

The two images are:

- `ksk20/lab8-khaled_kanawati:0.0.1.RELEASE` - original Lab 5 API, port 5000
- `ksk20/lab8-khaled_kanawati:0.0.2.RELEASE` - get_users API, port 3000

Both containers mount the named volume `lab8_users_data` at `/data` so they read the same SQLite database.

Test the endpoints:

```powershell
Invoke-RestMethod http://localhost:5000/api/users
Invoke-RestMethod http://localhost:3000/get_users
```

The second endpoint returns the names of users present in the Lab 5 database. The API endpoints and request structure for creating/updating/deleting users are in the Postman collection. Docker images can also be viewed in Docker Desktop under Images.
