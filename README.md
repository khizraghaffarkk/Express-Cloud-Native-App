# Express-Cloud-Native-App
This project is a simple Express.js application that runs inside a Docker container and is deployed using Kubernetes (Minikube).

## Prerequisites

Make sure you have the following tools installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Kubernetes](https://kubernetes.io/docs/tasks/tools/) (Minikube preferred for local setup)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Node.js](https://nodejs.org/en/download/)

## Running the Application Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/khizraghaffarkk/my-express-app.git
   cd my-express-app
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the app locally:
   ```bash
   node app.js
   ```
   ```bash
   The app will be running at http://localhost:5001.
   ```

## Dockerize the Application
1. Build the Docker image:
   ```bash
   docker build -t khizraghaffar/my-express-app:1.0 .
   ```
2. Run the Docker container:
   ```bash
   docker run -d -p 5001:5001 khizraghaffar/my-express-app:1.0
   ```
   ```bash
   You can access the app at http://localhost:5001.
   ```
3. Push the Docker image to Docker Hub (replace with your Docker Hub username):
   ```bash
   docker login
   docker push khizraghaffar/my-express-app:1.0
   ```

## Kubernetes Deployment (Minikube)
1. Start Minikube:
   ```bash
   minikube start
   ```
3. Create a deployment and service using the deployment.yml & service.yml files
4. Deploy the app to Kubernetes:
   ```bash
   kubectl apply -f kubernetes-deployment.yaml
   ```
5. Verify that the pod is running:
   ```bash
   kubectl get pods
   ```
6. Expose the service (if not already exposed in your yaml):
   ```bash
   kubectl expose deployment sim-app-deploy --type=NodePort --port=5001
   ```
7. Get the Minikube IP and access the app in your browser:
   ```bash
   minikube ip
      ```
   ```bash
   Go to http://<minikube_ip>:30001
   ```

## Accessing the Application via Port Forwarding (Alternative Method)
If you prefer port forwarding instead of exposing the service, you can run the following command:
   ```bash
   kubectl port-forward pod/sim-app-deploy-xxxxxxxxxx-yyyyy 5001:5001
   ```
   ```bash
   You can now access the application on http://localhost:5001.
   ```
## Troubleshooting
If you face any issues accessing the app, ensure the pod and service are running by using the following commands:
  ```bash
  kubectl get pods
  kubectl get svc
  kubectl logs <pod-name>
  ```

