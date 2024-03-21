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
