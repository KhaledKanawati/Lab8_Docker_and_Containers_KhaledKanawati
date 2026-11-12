# Build the two Docker images and start their containers.
$image = 'ksk20/lab8-khaled_kanawati'

docker build -t "${image}:0.0.1.RELEASE" -f lab5_api/Dockerfile .
if ($LASTEXITCODE -ne 0) { exit 1 }

docker build -t "${image}:0.0.2.RELEASE" -f get_users_api/Dockerfile .
if ($LASTEXITCODE -ne 0) { exit 1 }

docker volume create lab8_users_data | Out-Null
docker rm -f lab8-lab5 lab8-get-users 2>$null | Out-Null

docker run -d --name lab8-lab5 -p 5000:5000 -v lab8_users_data:/data "${image}:0.0.1.RELEASE"
docker run -d --name lab8-get-users -p 3000:3000 -v lab8_users_data:/data "${image}:0.0.2.RELEASE"

docker ps --filter 'name=lab8-'
docker images $image
