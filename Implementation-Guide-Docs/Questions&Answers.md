## Part 1 <a name="p1"></a>

1. <ins> Why do we need a binary file? Can we run the application without the binary file? naming convention for binary file.</ins>

A binary file is crucial because it contains the compiled code that the system can execute directly. In languages like Go, the source code is not directly executable by the operating system.
Instead, it needs to be compiled into a binary, which translates the human-readable code into machine code that the CPU can run.

Without a binary file, you cannot run the application, as the system cannot interpret the source code directly. The binary file serves as the executable form of your application.

Naming Convention: Binary files are usually named after the application or a descriptive term, often matching the main file or function they execute (e.g., myapp, server).
On Unix-like systems, there is no extension, but on Windows, a .exe extension is common. It's important to use clear, consistent names to avoid confusion, especially in multi-stage builds.

2. <ins>How is Docker Desktop helping ?</ins>

Docker Desktop is essential for developing and testing containerized applications locally. It allows you to build and run Docker images on your machine,
manage containers through a user-friendly interface, and push images to Docker Hub.
Additionally, it integrates with Kubernetes, enabling you to test deployments locally before moving to a cloud environment like EKS. This streamlines the entire containerization process, from development to deployment.

In my case, Docker Desktop also acts as the systemd equivalent for WSL. It manages the Docker daemon, allowing you to run Docker commands and services within WSL without needing systemd,
which isn't available by default on WSL. This enables seamless container management and orchestration in a WSL environment.

3.<ins> What is a distroless image? How does it help? how do you choose a distroless image?</ins>

A distroless image is a minimal Docker image containing only the essential components needed to run your application—without an entire operating system, unnecessary tools, or libraries.

𝗦𝗲𝗰𝘂𝗿𝗶𝘁𝘆: By eliminating package managers and shells, distroless images reduce the attack surface, making the container more secure.

𝗘𝗳𝗳𝗶𝗰𝗶𝗲𝗻𝗰𝘆: It only contains the required runtime environment, making it lighter and faster. In the case of 'go', the application doesn't require a runtime environment like for java and pythons apps. 

𝗖𝗼𝘀𝘁 𝗦𝗮𝘃𝗶𝗻𝗴𝘀: Smaller images reduce storage and data transfer costs, especially in cloud environments.

𝗙𝗮𝘀𝘁𝗲𝗿 𝗣𝗶𝗽𝗲𝗹𝗶𝗻𝗲𝘀: Optimized images lead to quicker build times and faster deployments, streamlining your CI/CD process.

4.<ins> What are systems like 'init' , 'upstart' or 'systeminit' ?</ins>

-------------------------------------------------------------------
## Part 2 <a name="p2"></a>

1. <ins>What is EXTERNAL_IP & INTERNAL_IP  when we run command kubectl get nodes -o wide?</ins>

**INTERNAL_IP:** This is the IP address of the node within the Kubernetes cluster's internal network. It's used for communication between nodes and pods within the same network. This IP address is usually private and is used for internal cluster operations.

**EXTERNAL_IP:** This is the IP address that is accessible from outside the Kubernetes cluster, typically via the public internet. Not all nodes have an external IP, especially if the cluster is running in a private or on-premises environment. If present, the EXTERNAL_IP allows external services or users to access applications running on the node directly.

2. <ins>What is differnce in ClusterIP , NodePort and LoadBalancer? Why are we not using LoadBalancer type?</ins>

**ClusterIP:** This is the default service type in Kubernetes. It creates a virtual IP within the cluster that can be accessed only internally by other services or pods within the same cluster. It is useful for internal communication within the cluster.

**NodePort:** This type exposes the service on a static port on each node's IP (the NodePort). This allows external access by sending a request to any node's IP address, using the specified port. It is more accessible than ClusterIP but is limited to the node's IP and port range.

**LoadBalancer:** This type automatically creates an external load balancer in the cloud provider's infrastructure (such as AWS, GCP, or Azure). The service is exposed with a public IP, making it accessible from outside the cluster. It is ideal for exposing services directly to the internet.

<ins>Why are we not using LoadBalancer?</ins>

**Cost and Complexity:** Using a LoadBalancer in a cloud environment like AWS can incur additional costs because it provisions an external load balancer in the cloud provider's infrastructure.

**Environment Setup:** For development or testing environments, you might not need a LoadBalancer as NodePort or ClusterIP might suffice. NodePort can be easier and cheaper for environments where public access is not required or can be managed manually.

-----------------------------------------------------------------------------------------------------
## Part 3 <a name="p3"></a>

1. <ins> How does SSL/TLS termination work with an Ingress Controller, and can I configure it for different services?</ins>
 SSL/TLS termination with an Ingress Controller allows the controller to handle HTTPS traffic by decrypting it before passing it to the backend services. You configure SSL termination by specifying TLS certificates in the Ingress manifest.
 Multiple services can have separate SSL configurations by defining different hostnames and associating each with its own TLS certificate within the same Ingress resource. This allows for secure communication without exposing certificates directly to the services.

2. <ins>What are the best practices for scaling an Ingress Controller in a large Kubernetes deployment?</ins>
Best practices for scaling an Ingress Controller include:
- Deploying the Ingress Controller as a DaemonSet to ensure it runs on every node and scales automatically with the cluster.
- Using Horizontal Pod Autoscalers (HPA) to scale the number of Ingress Controller replicas based on CPU or memory usage.
- Distributing traffic across multiple Ingress Controllers to avoid overloading a single controller.
- Configuring resource limits and requests appropriately to prevent bottlenecks.
- Utilizing advanced caching mechanisms and optimizing timeouts to handle high traffic.

3. <ins>How do readiness and liveness probes interact with Ingress Controllers in Kubernetes?</ins>
Readiness probes help ensure that a Pod is ready to receive traffic. An Ingress Controller will only route traffic to Pods that have passed their readiness checks. Liveness probes ensure that a Pod is healthy and operational.
If a liveness probe fails, Kubernetes restarts the Pod. Ingress Controllers rely on these probes to decide which Pods to route traffic to, ensuring that only healthy and ready Pods receive requests.

4. <ins>What are some common performance bottlenecks when using Ingress Controllers in production?</ins>
Common performance bottlenecks with Ingress Controllers include:
- Overloaded Ingress Controller Pods due to insufficient resources or too few replicas.
- Inefficient routing rules or complex regex rules that slow down request processing.
- SSL/TLS termination overhead if not optimized.
- Limited network bandwidth or high latency between nodes and the Ingress Controller.
- Lack of caching or improper timeouts leading to increased load on backend services.

5.<ins> How do I secure my Ingress resources and Ingress Controllers against potential vulnerabilities or attacks?</ins>
To secure Ingress resources and Ingress Controllers:
- Use TLS/SSL certificates for HTTPS communication and enable strong cipher suites.
- Implement Web Application Firewall (WAF) rules to filter malicious traffic.
- Regularly update the Ingress Controller to patch security vulnerabilities.
- Limit access by using network policies to control which Pods or services can interact with the Ingress Controller.
- Use rate limiting and DDoS protection mechanisms to safeguard against traffic spikes.
- Ensure proper RBAC policies to prevent unauthorized changes to Ingress resources.

-------------------------------------------------------------------------------------------------
## Part 4 <a name="p4"></a>

1.<ins> What is Helm, and how does it help with Kubernetes deployments?</ins>
Helm is a package manager for Kubernetes that simplifies the deployment, management, and scaling of applications. It uses "charts," which are packages of pre-configured Kubernetes resources. 
Helm helps by providing a consistent way to deploy applications, manage configuration through parameterized values files, and handle updates and rollbacks. It also offers templating features that make it easier to manage complex Kubernetes configurations.

2. <ins>How do Helm charts handle versioning, and how can we manage different environments (e.g., dev, prod) using the same chart?</ins>
Helm charts handle versioning through the Chart.yaml file, where you can specify the chart version. For managing different environments,
Helm allows you to use values files (values.yaml) to provide environment-specific configurations. You can create separate values files for each environment (e.g., values-dev.yaml, values-prod.yaml) and specify the appropriate file during deployment using the -f flag.

4. <ins>What are some common challenges or pitfalls to watch out for when using Helm in production environments?</ins>
Common challenges include managing chart dependencies, ensuring consistent values across environments, and dealing with complex templating issues.
Additionally, Helm’s release management can be complex, especially with large-scale deployments.
It’s important to thoroughly test Helm charts in staging environments before deploying to production and to keep Helm and its dependencies updated to mitigate security vulnerabilities.

6. <ins>How do Helm rollbacks work, and are there any limitations or risks associated with them?</ins>
Helm rollbacks allow you to revert to a previous release version if the current deployment has issues. This is done by tracking the release history and using the helm rollback command.
Limitations include the potential for incomplete rollbacks if resources have changed significantly between versions. Rollbacks may not always fully revert changes in custom resources or external dependencies, so thorough testing is essential

--------------------------------------------------------------------------------------------------
## Part 5 <a name="p5"></a>


------------------------------------------------------------------------------------------------
## Part 6 <a name="p6"></a>

