docker build -t maknovicell/multi-client-k8s:latest -t maknovicell/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t maknovicell/multi-server-k8s:latest -t maknovicell/multi-server-k8s:$SHA -f ./server/Dockerfile ./server
docker build -t maknovicell/multi-worker-k8s:latest -t maknovicell/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push maknovicell/multi-client-k8s:latest
docker push maknovicell/multi-server-k8s:latest
docker push maknovicell/multi-worker-k8s:latest

docker push maknovicell/multi-client-k8s:$SHA
docker push maknovicell/multi-server-k8s:$SHA
docker push maknovicell/multi-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=maknovicell/multi-server-k8s:$SHA
kubectl set image deployments/client-deployment client=maknovicell/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=maknovicell/multi-worker-k8s:$SHA