-------7-------
minikube start --nodes 3 -p ensf400
kubectl get nodes
minikube status -p ensf400
cd /workspaces/ensf400-lab8-kubernetes-2/7-scheduling
kubectl label nodes ensf400-m02 mynode=worker-1
kubectl apply -f pod-nginx.yaml
kubectl get pods -o wide
kubectl describe pod nginx
kubectl delete -f pod-nginx.yaml
kubectl apply -f pod-nginx.yaml
kubectl get po -o wide
kubectl describe pod nginx
kubectl label node ensf400-m03 mynode=worker-x
kubectl get po -o wide

kubectl label nodes ensf400-m02 mynode=worker-1
kubectl label nodes ensf400-m03 mynode=worker-x
kubectl apply -f pod-with-node-affinity.yaml
kubectl get pods --output=wide
kubectl describe po
kubectl delete -f pod-with-node-affinity.yaml

kubectl apply -f deploy-with-node-anti-affinity.yaml
kubectl delete -f deploy-with-node-anti-affinity.yaml
kubectl apply -f pod-nginx.yaml

//-------------------8-------------
cd ../8-configmap
kubectl apply -f configmap.yaml
kubectl get configmap
kubectl apply -f pod.yaml
kubectl exec -it configmappod -- printenv
kubectl create configmap myconfigmap2 --from-literal=background=red --from-file=theme.txt
kubectl get configmap myconfigmap2 -o yaml
kubectl delete configmap myconfigmap2

//-------------------9----------------

//-------------------10--------------
cd 10-blue-green-deploy
kubectl apply -f blue.yml
kubectl get pods --show-labels
kubectl apply -f green.yml
kubectl get pods --show-labels
kubectl apply -f svc.yml
kubectl exec -it bluepod -- bash
echo "Hello from Blue-Pod" >> htdocs/index.html
exit
kubectl exec -it greenpod -- bash
echo "Hello from Green-Pod" >> htdocs/index.html
exit
kubectl get pods -o wide
kubectl run -it --rm --image=curlimages/curl curly -- sh
curl 10.244.2.2
curl 10.244.1.2
exit
kubectl get svc
kubectl run -it --rm --image=curlimages/curl curly -- sh
curl myapp
exit
kubectl patch service myapp -p '{"spec":{"selector":{"app": "green"}}}'
kubectl run -it --rm --image=curlimages/curl curly -- sh
curl myapp
exit
