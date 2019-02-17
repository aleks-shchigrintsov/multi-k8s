docker build -t shchigrintsov/multi-client:latest -t shchigrintsov/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shchigrintsov/multi-server:latest -t shchigrintsov/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shchigrintsov/multi-worker:latest -t shchigrintsov/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push shchigrintsov/multi-client:latest
docker push shchigrintsov/multi-server:latest
docker push shchigrintsov/multi-worker:latest

docker push shchigrintsov/multi-client:$SHA
docker push shchigrintsov/multi-server:$SHA
docker push shchigrintsov/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image shchigrintsov/server-deployment server=shchigrintsov/multi-server:$SHA
kubectl set image shchigrintsov/client-deployment client=shchigrintsov/multi-client:$SHA
kubectl set image shchigrintsov/worker-deployment worker=shchigrintsov/multi-worker:$SHA
